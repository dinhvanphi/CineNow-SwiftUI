//
//  AppConfig.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation

enum AppConfig {
    static let baseUrl = "https://5ea38adacecc.ngrok-free.app"
    
    enum API {
        static let register = "/api/register"
        static let verifyAccount = "/api/verify-account"
        static let login = "/api/login"
        static let movies = "/api/movies"
        
    }
}

