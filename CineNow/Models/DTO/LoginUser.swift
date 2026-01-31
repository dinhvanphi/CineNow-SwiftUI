//
//  LoginUser.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 30/1/26.
//

import Foundation

struct LoginUser : Codable {
    let email : String
    let phone : String
    
    
    enum CodingKeys : String , CodingKey {
       
        case email
        case phone
    }
}
