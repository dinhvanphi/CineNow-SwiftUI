//
//  User.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation

struct User : Identifiable , Codable {
    let id = UUID()
    var name : String
    var email : String
    var phone : String?
    let role : String
    let createdAt : String
    var isVerified : Bool
    var googleId : String?
    var avatarUrl : String?
    var updatedAt : Date
    
    enum CodingKeys : String , CodingKey {
        case id , name , email , role , phone
        case createdAt = "created_at"
        case isVerified = "is_verified"
        case googleId = "google_id"
        case avatarUrl = "avatar_url"
        case updatedAt = "updated_at"
    }
   
}
