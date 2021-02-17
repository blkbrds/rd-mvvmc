//
//  TrendingViewController.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/17/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import UIKit

final class TrendingViewController: UIViewController {
    
    let viewModel: TrendingViewModel = TrendingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        getTrending()
    }
    
    private func getTrending() {
        showHUD()
        viewModel.getTrending { [weak self] result in
            guard let this = self else { return }
            this.hideHUD()
            switch result {
            case .success:
                print("Success")
            case .failure(let error):
                this.showError(error)
            }
        }
    }
}
