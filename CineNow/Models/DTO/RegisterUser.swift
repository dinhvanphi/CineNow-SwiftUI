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
    let varified : Bool
    let message : String 
}
