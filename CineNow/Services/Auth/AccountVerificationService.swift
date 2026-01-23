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
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body : [String :Any] = [
            "email" : email ,
            "otp" : otp
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        URLSession.shared.dataTask(with: request) { data , response , error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data ,
                  let httpResponse = response as? HTTPURLResponse
            else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(.badServerResponse)))
                }
                return
            }
            DispatchQueue.main.async {
                do {
                    let decoded = try JSONDecoder().decode(
                        VerifyAccountResponse.self,
                        from: data
                    )
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }
           
        }.resume()
    }
}
