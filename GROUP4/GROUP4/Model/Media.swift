//
//  Media.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/4/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

enum MediaType: String, Codable {
    case all, movie, tv, person, unknow
}

enum TimeWindow: String {
    case day, week
}

struct Media: Codable {
    
    let adult: Bool
    let backdropPath: String
    let originalTitle: String
    let posterPath: String
    let video: Bool
    let id: Int
    let voteCount: Int
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let title: String
    let popularity: Double
    let mediaType: MediaType
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case id
        case voteCount = "vote_count"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case title
        case popularity
        case mediaType = "media_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult).unwrapped(or: false)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath).orEmpty
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle).orEmpty
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath).orEmpty
        video = try container.decodeIfPresent(Bool.self, forKey: .video).unwrapped(or: false)
        id = try container.decode(Int.self, forKey: .id)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount).orZero
        overview = try container.decodeIfPresent(String.self, forKey: .overview).orEmpty
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate).orEmpty
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage).orZero
        title = try container.decodeIfPresent(String.self, forKey: .title).orEmpty
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity).orZero
        mediaType = try container.decodeIfPresent(MediaType.self, forKey: .mediaType).unwrapped(or: .unknow)
    }
}
