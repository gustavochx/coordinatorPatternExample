//
//  ModuleCoordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique Frota Soares on 11/03/21.
//

import UIKit


protocol BackToMainFlow: class {
    func navigateToMainModule()
}

class ModuleCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: BackToMainModule delegate variable
    weak var flow: BackToMainFlow?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let moduleMainViewController = ModuleViewController.instantiate()
        moduleMainViewController.delegate = self
        self.navigationController.pushViewController(moduleMainViewController, animated: true)
    }

    func startWithMerchantId(merchantId: String) {
        let moduleMainViewController = ModuleViewController.instantiate()
        moduleMainViewController.viewModel.merchantId = merchantId
        moduleMainViewController.delegate = self
        self.navigationController.pushViewController(moduleMainViewController, animated: true)
    }
    
}

extension ModuleCoordinator: BackToMainFlowDelegate {

    func backToMainModule() {
        self.flow?.navigateToMainModule()
    }
    
}
