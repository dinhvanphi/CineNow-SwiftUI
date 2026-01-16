//
//  Movie.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import Foundation

struct Movie : Identifiable , Codable {
    let id : Int
    let title : String
    let originalTitle : String
    let originalLanguage : String
    let overview : String
    let releaseDate : Date
    var popularity : Double
    var voteAverage : Double
    var voteCount : Int
    let adult : Bool
    let posterPath : String?
    let backdropPath : String?
    var status : String
    var featured : Bool
    let image : String?
    let backdropImage : String?
    
    enum CodingKeys : String , CodingKey {
        case id , title , overview , popularity , adult , status , featured , image
        case originalLanguage = "original_languge"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case backdropImage = "backdrop_image"
    }
}
