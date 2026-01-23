//
//  TokenManager.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation

final class TokenManager {
    static let shared = TokenManager()
    private init () {}
    
    private let tokenKey = "auth_token"
    
    func save(_ token : String){
        UserDefaults.standard.set(token , forKey: tokenKey)
    }
    func getToken() -> String? {
        UserDefaults.standard.string(forKey: tokenKey)
    }
    func clear () {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
