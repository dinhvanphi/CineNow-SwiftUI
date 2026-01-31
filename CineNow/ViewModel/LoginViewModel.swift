//
//  LoginViewModel.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 31/1/26.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published var emailOrPhone = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var shouldNavigatetoHome = false
    @Published var tempUser: User?
    
    func login() {
        guard !emailOrPhone.isEmpty, !password.isEmpty else {
            errorMessage = "Vui lòng nhập đầy đủ thông tin"
            return
        }
        
        isLoading = true
        errorMessage = nil
        shouldNavigatetoHome = false
        
        LoginService.shared.login(
            emailOrPhone: emailOrPhone,
            password: password
        ) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let response):
                if response.success {
             
                    if let user = response.user {
                        self.tempUser = User(from : user)
                        self.shouldNavigatetoHome = true
                    } else {
                        self.errorMessage = "Dữ liệu người dùng không hợp lệ"
                    }
                } else {
                    self.errorMessage = response.message
                }
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
