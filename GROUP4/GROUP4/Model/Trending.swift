//
//  Trending.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/4/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

struct Trending: Codable {
    
    let page: Int
    let results: [Media]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decodeIfPresent(Int.self, forKey: .page).orZero
        results = try container.decodeIfPresent([Media].self, forKey: .results).unwrapped(or: [])
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages).orZero
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults).orZero
    }
}
