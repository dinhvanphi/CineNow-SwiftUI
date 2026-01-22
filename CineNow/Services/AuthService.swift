//
//  AuthService.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 21/1/26.
//

import Foundation
struct ApiErrorResponse : Decodable {
    let success : Bool
    let message : String
}

final class AuthService {
    static let shared = AuthService()
    private init () {}
    
    func register (
        name : String ,
        email : String ,
        phone : String ,
        password : String ,
        completion : @escaping(Result<RegisterResponse , Error>) -> Void
        
        
    ) {
        guard let url = URL(string: "https://282e46ea4587.ngrok-free.app/api/register") else {
            return
        }
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        request.setValue("application/json" , forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "name": name,
            "email": email,
            "phone": phone,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data , response , error in
            if let error = error {
                DispatchQueue.main.async{
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
            DispatchQueue.main.async{
                do {
                    // success message
                    if (200...299).contains(httpResponse.statusCode){
                        let decoded = try JSONDecoder().decode(RegisterResponse.self , from : data)
                        completion(.success(decoded))
                    } else {
                        // bad response
                        let errorResponse = try JSONDecoder().decode(ApiErrorResponse.self, from: data)
                        let response = RegisterResponse (success: false, user: nil, verified: false, message: errorResponse.message)
                        completion(.success(response))
                        
                    }
                    
                } catch {
                    completion(.failure(error))
                }
            }
                    
        }.resume()
    }
}
