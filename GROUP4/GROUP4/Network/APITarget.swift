//
//  APITarget.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/4/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation
import Moya

enum APITarget {
    case trending(type: MediaType, time: TimeWindow)
}

extension APITarget: TargetType {
    
    var baseURL: URL {
        guard let url: URL = URL(string: APIConstants.baseURLString) else {
            fatalError("Invalid API URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .trending(let type, let time):
            return "/trending/\(type.rawValue)/\(time.rawValue)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .trending:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data("{}".utf8)
    }
    
    var task: Task {
        let parameters: [String: Any] = [
            "api_key": APIConstants.apiKey
        ]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    var headers: [String: String]? {
        return nil
    }
}
