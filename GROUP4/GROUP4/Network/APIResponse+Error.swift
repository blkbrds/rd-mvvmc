//
//  APIResponse+Error.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/5/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

struct EmptyResponse: Codable { }

struct APIError: Codable {
    
    let message: String
    let success: Bool
    let code: Int
    
    private enum CodingKeys: String, CodingKey {
        case message = "status_message"
        case success
        case code = "status_code"
    }
}
