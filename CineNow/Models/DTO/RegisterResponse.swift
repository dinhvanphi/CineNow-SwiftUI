//
//  RegisterResponse.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation

struct RegisterResponse : Codable {
    let success : Bool
    let user : RegisterUser?
    let verified : Bool
    let message : String
}

extension User {
    init (from dto : RegisterUser) {
        self.id = UUID()
        self.name = dto.name
        self.email = dto.email
        self.phone = dto.phone
        self.role = "user"
        self.createdAt = ISO8601DateFormatter().date(from: dto.createdAt) ?? Date()
        self.isVerified = false
        self.googleId = nil
        self.avatarUrl = nil
        self.updatedAt = Date()
    }
}
