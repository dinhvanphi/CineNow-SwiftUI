//
//  AccountVerificationService.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation

final class AccountVerificationService {
    static let shared = AccountVerificationService()
    private init () {}
    
    func verifyAccount(
        email : String ,
        otp : String,
        completion : @escaping (Result<VerifyAccountResponse , Error>) -> Void
    ) {
        let urlString = AppConfig.baseUrl + AppConfig.API.verifyAccount
        guard let url = URL(string : urlString) else {
            return
        }

        var request = URLRequest(url : url)
        request.httpMethod = "POST"
    }
}
