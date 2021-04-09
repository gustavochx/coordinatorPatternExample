//
//  ThirdScreenCoordinator.swift
//  CoordinatorPoc
//
//  Created by filipe on 08/04/21.
//

import UIKit

protocol BackToSecondScreenFlow: class {
    func navigateToMainModule()
}

class ThirdScreenCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    //MARK: BackToMainModule delegate variable
    weak var flow: BackToMainFlowDelegate?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let moduleMainViewController = ThirdScreenViewController.instantiate()
        moduleMainViewController.delegate = self
        self.navigationController.pushViewController(moduleMainViewController, animated: true)
    }

    func startWithMerchantId(merchantId: String, name: String) {
        let thirdScreenViewController = ThirdScreenViewController.instantiateFrom(storyboardName: StoryboardName.storyboard.rawValue)
        thirdScreenViewController.viewModel.merchantId = merchantId
        thirdScreenViewController.viewModel.name = name
        thirdScreenViewController.delegate = self
        self.navigationController.pushViewController(thirdScreenViewController, animated: true)
    }
    
    
}
extension ThirdScreenCoordinator: BackToSecondScreenDelegate {
    func backToSecondModule() {
        
    }
}
