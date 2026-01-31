//
//  LoginUser.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation
struct LoginUser: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String?
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone
        case createdAt = "created_at"
    }
}
