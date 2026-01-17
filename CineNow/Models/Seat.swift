//
//  Seat.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation

struct Seat : Identifiable , Codable {
    let id : UUID
    let roomId : Int
    let seatName : String
    let seatType : String
    let seatStatus : String
    let rowLetter : String
    let rowNumber : Int
    let priceId : Int
    
    enum CodingKeys : String , CodingKey {
        case id = "seat_id"
        case roomId = "room_id"
        case seatName = "seat_name"
        case seatType = "seat_type"
        case seatStatus = "seat_status"
        case rowLetter = "row_letter"
        case rowNumber = "row_number"
        case priceId = "price_id"
    }
}
