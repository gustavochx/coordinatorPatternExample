//
//  ModuleCoordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique Frota Soares on 11/03/21.
//

import UIKit


protocol BackToMainModuleDelegate: class {
    func navigateToMainModule(newOrderCoordinator: ModuleCoordinator)
}


class ModuleCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: BackToMainModule delegate variable
    weak var delegate: BackToMainModuleDelegate?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let moduleMainViewController = instantiateModuleMainViewController()
        moduleMainViewController.delegate = self
        self.navigationController.pushViewController(moduleMainViewController, animated: true)
    }

    private func instantiateModuleMainViewController() -> ModuleViewController {
        return ModuleViewController.init(nibName: ModuleViewController.reusableIdentifier, bundle: .main)
    }

}


extension ModuleCoordinator: ModuleViewControllerDelegate {

    func backToMainModule() {
        self.delegate?.navigateToMainModule(newOrderCoordinator: self)
    }
    
}
