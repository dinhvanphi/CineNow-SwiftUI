//
//  Showtime.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation

struct Showtime : Identifiable , Codable {
    let id : Int
    let movieId : Int
    let roomId : Int
    var startTime : Date
    var endTime : Date
    var status : String
    
    enum CodingKeys : String , CodingKey {
        case id = "showtime_id"
        case status
        case movieId = "movie_id"
        case roomId = "room_id"
        case startTime = "srart_time"
        case endTime = "end_time"
    }
    

}
