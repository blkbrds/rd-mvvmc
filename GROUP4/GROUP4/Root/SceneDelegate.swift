//
//  SceneDelegate.swift
//  GROUP4
//
//  Created by Khoa Vo T.A. on 2/4/21.
//  Copyright © 2021 Khoa Vo T.A. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene: UIWindowScene = (scene as? UIWindowScene) else { return }
        let window: UIWindow = UIWindow(windowScene: scene)
        window.rootViewController = TrendingViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
