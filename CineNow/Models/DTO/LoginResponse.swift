//
//  LoginResponse.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let user: User?
    let message: String
}




