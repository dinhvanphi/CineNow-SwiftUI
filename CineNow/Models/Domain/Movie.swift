struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let status: String
    let featured: Bool
    let image: String
    let backdropImage: String

    enum CodingKeys: String, CodingKey {
        case id, title, overview, status, featured, image
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case backdropImage = "backdrop_image"
    }
}

