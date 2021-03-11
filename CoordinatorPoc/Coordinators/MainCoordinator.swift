//
//  MainCoordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var delegate: AppDelegate?
    var window: UIWindow

    required init(delegate: AppDelegate, window: UIWindow) {
        self.delegate = delegate
        self.window = window
    }

    func start() {
        navigationToFirstController()
    }

    func navigationToFirstController(showSignIn: Bool = false) {

        let navigationController = UINavigationController(rootViewController: instantiateViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        UIView.transition(with: window,
                          duration: 0.4,
                          options: .transitionCurlDown,
                          animations: nil,
                          completion: nil)
    }

    private func instantiateViewController() -> MainViewController {
        return MainViewController(nibName: MainViewController.reusableIdentifier, bundle: .main)
    }

    
}
