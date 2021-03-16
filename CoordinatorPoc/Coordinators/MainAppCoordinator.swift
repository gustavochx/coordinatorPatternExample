//
//  MainCoordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

class MainAppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationToFirstController()
    }

    func navigationToFirstController(showSignIn: Bool = false) {
        let mainViewController = MainViewController.instantiate()
        mainViewController.flow = self
        navigationController = UINavigationController(rootViewController: mainViewController)
    }

}

extension MainAppCoordinator: MainFlow {

    func add(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func navigateToModuleViewController() {
        let moduleCoordinator = ModuleCoordinator(navigationController: self.navigationController)
        moduleCoordinator.flow = self
        childCoordinators.append(moduleCoordinator)

        moduleCoordinator.startWithMerchantId(merchantId: "hu3")
//        moduleCoordinator.start()
    }
}

extension MainAppCoordinator: BackToMainFlow {

    func navigateToMainModule() {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }

}
