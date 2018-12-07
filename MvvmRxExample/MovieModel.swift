//
//  MovieModel.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 6.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit


struct Popular: Codable {
    let page, totalResults, totalPages: Int
    var results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct Movie: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    var posterPath: String
    let originalLanguage: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String = ""
    let adult: Bool
    let overview, releaseDate: String
    var isFavorite :Bool = false
    
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

