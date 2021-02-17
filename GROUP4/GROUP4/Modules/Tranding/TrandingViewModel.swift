//
//  TrandingViewModel.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/17/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import Foundation

final class TrandingViewModel {
    
    private(set) var tranding: Trending?
    private let provider: APINetworking
    
    init(provider: APINetworking = apiProvider) {
        self.provider = provider
    }
    
    func getTranding(completion: @escaping (APICompletion<Error>) -> Void) {
        requestTranding { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let value):
                this.tranding = value
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func requestTranding(completion: @escaping (Result<Trending, Error>) -> Void) {
        provider.request(.trending(type: .movie, time: .day), completion: completion)
    }
}
