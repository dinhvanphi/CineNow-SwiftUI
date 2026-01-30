//
//  LoginUser.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation

struct LoginUser : Codable {
    let emailOrPhone : String
    let password : String
    
    enum CodingKeys : String , CodingKey {
        case password
        case emailOrPhone 
    }
}
