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

    weak var flow: BackToMainFlow?
    weak var storyboard: UIStoryboard?
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {}

    func startWithMerchantId(merchantId: String, name: String) {
        start()
        let moduleMainViewController = ModuleViewController.instantiate()
        moduleMainViewController.viewModel.merchantId = merchantId
        moduleMainViewController.viewModel.name = name
        moduleMainViewController.delegate = self
        moduleMainViewController.flow = self
        self.navigationController.pushViewController(moduleMainViewController, animated: true)
    }
    
}


extension ModuleCoordinator: BackToMainFlowDelegate {
      func backToMainModule() {
        self.flow?.navigateToMainModule()
    }
    
}


extension ModuleCoordinator: FlowModuleCoordinatorDelegate {
    func add(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func navigateToThirdViewController(name: String) {
        let thirdScreenCoordinator = ThirdScreenCoordinator(navigationController: self.navigationController)
        thirdScreenCoordinator.flow = self
        childCoordinators.append(thirdScreenCoordinator)
        thirdScreenCoordinator.startWithMerchantId(merchantId: "hu3", name: name)
    }
}

