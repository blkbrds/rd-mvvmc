//
//  TrandingViewController.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/17/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import UIKit

final class TrandingViewController: UIViewController {
    
    let viewModel: TrandingViewModel = TrandingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        getTranding()
    }
    
    private func getTranding() {
        showHUD()
        viewModel.getTranding { [weak self] result in
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
