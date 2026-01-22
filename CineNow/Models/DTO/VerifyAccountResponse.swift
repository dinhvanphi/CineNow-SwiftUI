//
//  VerifyAccountResponse.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 22/1/26.
//

import Foundation

struct VerifyAccountResponse : Codable{
    let success : String
    let message : String
    let token : String?
    
    enum CodingKeys : String , CodingKey {
        case success , message , token

    }
}
