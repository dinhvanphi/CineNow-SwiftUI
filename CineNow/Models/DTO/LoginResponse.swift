//
//  LoginResponse.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let user: LoginUser?
    let message: String
}
extension User {
    init(from dto: LoginUser) {
//        self.id = UUID()
        self.name = dto.name
        self.email = dto.email
        self.phone = dto.phone
        self.role = "user"
        self.createdAt = dto.createdAt
        self.isVerified = false
        self.googleId = nil
        self.avatarUrl = nil
        self.updatedAt = Date()
    }
}




