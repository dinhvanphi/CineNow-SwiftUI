//
//  LoginResponse.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let user: UserDTO?
    let message: String
}

struct UserDTO: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case createdAt = "created_at"
    }
}


