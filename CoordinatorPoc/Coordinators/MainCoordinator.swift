//
//  MainCoordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

class MainCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationToFirstController()
    }

    func navigationToFirstController(showSignIn: Bool = false) {
        let mainViewController = instantiateViewController()
        mainViewController.delegate = self
        navigationController = UINavigationController(rootViewController: mainViewController)
    }

    private func instantiateViewController() -> MainViewController {
        return MainViewController(nibName: MainViewController.reusableIdentifier, bundle: .main)
    }

}

extension MainCoordinator: MainViewControllerDelegate {

    func navigateToModuleViewController() {
        let moduleCoordinator = ModuleCoordinator(navigationController: self.navigationController)
        moduleCoordinator.delegate = self
        childCoordinators.append(moduleCoordinator)
        moduleCoordinator.start()
    }
}

extension MainCoordinator: BackToMainModuleDelegate {

    func navigateToMainModule(newOrderCoordinator: ModuleCoordinator) {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}
