//
//  AuthService.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 21/1/26.
//

import Foundation
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
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(RegisterResponse.self , from : data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
