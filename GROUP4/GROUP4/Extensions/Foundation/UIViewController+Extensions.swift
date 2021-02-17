//
//  UIViewController+Extensions.swift
//  GROUP4
//
//  Created by Cuong Doan M. on 2/17/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showError(_ error: Error, okHandler: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
        let message: String = error.localizedDescription
        let alert: UIAlertController = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        let ok: UIAlertAction = UIAlertAction(title: "OK", style: .default) { _ in
            okHandler?()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: completion)
    }
    
    func showHUD() {
        MBProgressHUD.showAdded(to: view, animated: false)
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: view, animated: false)
    }
}
