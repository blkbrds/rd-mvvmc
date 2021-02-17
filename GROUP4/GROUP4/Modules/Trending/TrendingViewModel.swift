//
//  TrendingViewModel.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/17/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

final class TrendingViewModel {
    
    private(set) var trending: Trending?
    private let provider: APINetworking
    
    init(provider: APINetworking = apiProvider) {
        self.provider = provider
    }
    
    func getTrending(completion: @escaping (APIResult<Error>) -> Void) {
        requestTrending { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let value):
                this.trending = value
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func requestTrending(completion: @escaping (Result<Trending, Error>) -> Void) {
        provider.request(.trending(type: .movie, time: .day), completion: completion)
    }
}
