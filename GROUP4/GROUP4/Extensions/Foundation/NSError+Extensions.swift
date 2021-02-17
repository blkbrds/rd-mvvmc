//
//  NSError+Extensions.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/5/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

extension NSError {

    convenience init(domain: String? = nil, code: Int = -999, message: String) {
        let domain: String = domain.unwrapped(or: Bundle.main.bundleIdentifier.orEmpty)
        let userInfo: [String: String] = [NSLocalizedDescriptionKey: message]
        self.init(domain: domain, code: code, userInfo: userInfo)
    }
}
