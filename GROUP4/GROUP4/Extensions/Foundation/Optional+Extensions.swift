//
//  Optional+Extensions.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/4/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

protocol CollectionOrString {
    var isEmpty: Bool { get }
}

extension String: CollectionOrString { }
extension Array: CollectionOrString { }
extension Dictionary: CollectionOrString { }
extension Set: CollectionOrString { }

extension Optional where Wrapped: CollectionOrString {

    var isNilOrEmpty: Bool {
        switch self {
        case let .some(value): return value.isEmpty
        default: return true
        }
    }
}

extension Optional {

    func unwrap(_ closure: (Wrapped) -> Void) {
        self.map(closure)
    }

    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        if let this: Wrapped = self {
            return this
        }
        return defaultValue
    }
}

extension Optional where Wrapped == String {

    var orEmpty: String {
        if let this: String = self {
            return this
        }
        return ""
    }
}

extension Optional where Wrapped == Int {

    var orZero: Int {
        if let this: Int = self {
            return this
        }
        return 0
    }
}

extension Optional where Wrapped == Double {

    var orZero: Double {
        if let this: Double = self {
            return this
        }
        return 0
    }
}

extension Optional where Wrapped == [Any] {

    var orEmpty: [Any] {
        if let this: [Any] = self {
            return this
        }
        return []
    }

    var isNilOrEmpty: Bool {
        switch self {
        case let .some(value): return value.isEmpty
        default: return true
        }
    }
}

extension Optional where Wrapped: ExpressibleByDictionaryLiteral, Wrapped.Key: ExpressibleByStringLiteral, Wrapped.Value: AnyObject {

    var orEmpty: Wrapped {
        if let this: Wrapped = self {
            return this
        }
        return [:]
    }
}
