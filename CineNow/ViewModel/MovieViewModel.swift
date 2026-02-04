//
//  MovieViewModel.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 4/2/26.
//

import Foundation
import Combine

final class MovieViewModel : ObservableObject {
    @Published var movies : [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage : String?
    
    var featuredMovies : [Movie]{
        movies.filter{$0.featured}
    }
    var nowShowingMovies : [Movie] {
        movies.filter{$0.status == "now_showing"}
    }
    var comingSoonMovies : [Movie]{
        movies.filter{$0.status == "coming_soon"}
    }
    
    func loadMovies () {
        isLoading = true
        
        MovieService.shared.fetchMovies {[weak self ] result in
            guard let self = self else {
                return
            }
            self.isLoading = false
            
            switch result {
            case.success(let movies) :
                self.movies = movies
                
            case.failure(let error) :
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
