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
    
    func start() {}

    func startWithMerchantId(merchantId: String, name: String) {
        let thirdScreenViewController = ThirdScreenViewController.instantiateFrom(storyboardName: StoryboardName.storyboard.rawValue)
        thirdScreenViewController.viewModel.merchantId = merchantId
        thirdScreenViewController.viewModel.name = name
        thirdScreenViewController.flow = self
        self.navigationController.pushViewController(thirdScreenViewController, animated: true)
    }
    
    
}
extension ThirdScreenCoordinator: FlowThirdScreen {
    func navigateToFourthViewController(name: String) {
        let fourthScreenCoordinator = FourthScreenCoordinator(navigationController: self.navigationController)
        childCoordinators.append(fourthScreenCoordinator)
        fourthScreenCoordinator.startWithMerchantId(merchantId: "hu3", name: name)
    }
}
