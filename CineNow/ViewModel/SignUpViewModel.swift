//
//  SignUpViewModel.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 21/1/26.
//

import Foundation
import Combine

final class SignUpViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isLoading = false
    @Published var errorMessage : String?
    @Published var shouldNavigatetoOTP = false
    @Published var tempUser : User?
    
    func register (){
        guard !name.isEmpty ,
              !email.isEmpty ,
              !phone.isEmpty ,
              !password.isEmpty else {
            errorMessage = "Vui lòng nhập đầy đủ thông tin"
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Mật khẩu xác nhận không khớp "
            return
        }
        isLoading = true
        errorMessage = nil
        shouldNavigatetoOTP = false
        
        SignUpService.shared.register(
            name : name ,
            email : email ,
            phone : phone ,
            password : password 
            
        ) {[weak self] result in
            guard let self = self else {
                return
            }
            self.isLoading = false
            
            switch result {
            case .success(let response) :
                if response.success , let registerUser = response.user {
                    let user = User(from : registerUser)
                    self.tempUser = user
                    self.shouldNavigatetoOTP = true
                } else {
                    self.errorMessage = response.message
                }
            case.failure(let error) :
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
