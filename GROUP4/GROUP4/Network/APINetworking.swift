//
//  APINetworking.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/5/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation
import Moya

enum APIResult<Failure> where Failure: Error {
    case success
    case failure(Failure)
}

protocol APINetworkingType {
        
    var provider: MoyaProvider<APITarget> { get }
    
    @discardableResult
    func request<T: Codable>(_ target: APITarget, completion: @escaping (Result<T, Error>) -> Void) -> Moya.Cancellable
}

let apiProvider: APINetworking = APINetworking()

class APINetworking: APINetworkingType {
    
    let provider: MoyaProvider<APITarget>
    
    init(isStubbed: Bool = false) {
        let stubClosure: MoyaProvider<APITarget>.StubClosure
        stubClosure = isStubbed ? MoyaProvider.immediatelyStub : MoyaProvider.neverStub
        provider = MoyaProvider(stubClosure: stubClosure)
    }
    
    @discardableResult
    func request<T: Decodable>(_ target: APITarget, completion: @escaping (Result<T, Error>) -> Void) -> Moya.Cancellable {
        return provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    if let apiError: APIError = try? response.map(APIError.self) {
                        let error: NSError = NSError(code: apiError.code, message: apiError.message)
                        completion(.failure(error))
                        return
                    }
                    let filteredResponse: Response = try response.filterSuccessfulStatusCodes()
                    let result: T = try filteredResponse.map(T.self)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
