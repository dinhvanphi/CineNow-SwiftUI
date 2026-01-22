//
//  Room.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation
struct Room : Identifiable , Codable {
    let id : Int
    let cinemaId : Int
    let name : String
    var capacity : Int
    
    enum CodingKeys : String , CodingKey {
        case name
        case capacity
        case id = "room_id"
        case cinemaId = "cinama_id"
    }
}
