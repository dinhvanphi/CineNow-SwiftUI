//
//  Cinema.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation
struct Cinema : Identifiable , Codable {
    let id : Int 
    let name : String
    let address : String
    let city : String
    
    enum CodingKeys :String , CodingKey {
        case id
        case name
        case address
        case city 
    }
}
