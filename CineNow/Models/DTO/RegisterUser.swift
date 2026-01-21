//
//  RegisterUser.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 21/1/26.
//

import Foundation
struct RegisterUser : Codable {
    let id : Int
    let name : String
    let email : String
    let phone : String
    let createdAt : String
    
    enum CodingKeys : String , CodingKey {
        case id , name , email , phone
        case createdAt = "created_at"
    }
}

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
