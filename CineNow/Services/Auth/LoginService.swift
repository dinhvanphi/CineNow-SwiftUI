//
//  LoginService.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 31/1/26.
//

import Foundation
struct APIErrorResponse : Decodable {
    let success : Bool
    let message : String
}

final class LoginService {
    
    static let shared = LoginService()
    private init () {}
    
    func login (
        emailOrPhone : String ,
        password : String ,
        completion : @escaping(Result <LoginResponse , Error>) -> Void

    ){
        let urlString = AppConfig.baseUrl + AppConfig.API.login
        guard let url = URL(string : urlString) else {
            return
        }
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "emailOrPhone": emailOrPhone,
            "password": password
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
                  let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(.badServerResponse)))
                }
                return
            }
            DispatchQueue.main.async {
                do {
                    // success message
                    if (200...299).contains(httpResponse.statusCode){
                        let decoded = try JSONDecoder().decode(LoginResponse.self , from : data)
                        completion(.success(decoded))
                    } else {
                        // bad message
                        let errorResponse = try JSONDecoder().decode(LoginResponse.self , from: data)
                        let response = LoginResponse (success : false , user: nil , message: errorResponse.message )
                        completion(.success(response))
                    }
                } catch {
                    completion(.failure(error))
                }
                
            }
        }.resume()

    }
}
