//
//  MovieService.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 4/2/26.
//

import Foundation
import Combine

final class MovieService {
    static let shared = MovieService()
    private init () {}
    
    func fetchMovies(
        completion : @escaping(Result <[Movie] , Error>) -> Void
    ){
        let urlString = AppConfig.baseUrl + AppConfig.API.movies
        guard let url = URL(string : urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){data , response , error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let data = data else {
                return
            }
            do {
                let movies = try JSONDecoder().decode([Movie].self , from : data)
                DispatchQueue.main.async {
                    completion(.success(movies))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
