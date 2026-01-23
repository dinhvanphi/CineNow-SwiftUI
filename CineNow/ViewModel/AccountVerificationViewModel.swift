//
//  AccountVerificationViewModel.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation
import Combine

public class AccountVerificationViewModel : ObservableObject {
    @Published var otp = ""
    
    @Published var isLoading = false
    @Published var errorMessage : String?
    @Published var isVerified = false
    
    let email : String
    init (email : String) {
        self.email = email
    }
    func verifyAccount () {
        guard otp.count == 6 else {
            errorMessage = "Mã OTP phải gồm 6 chữ số"
            return
        }
        isLoading = true
        errorMessage = nil
        AccountVerificationService.shared.verifyAccount(
            email: email,
            otp: otp
        ){
            [weak self] result in
            guard let self =  self else {
                return
            }
            self.isLoading = false
            
            switch result {
            case .success(let response) :
                if response.success {
                    if let token = response.token{
                        TokenManager.shared.save(token)
                    }
                    self.isVerified = true
                } else {
                    self.errorMessage = response.message
                }
            case .failure(let error) :
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
