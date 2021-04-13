//
//  FourthScreenCoordinator.swift
//  CoordinatorPoc
//
//  Created by filipe on 09/04/21.
//


import UIKit

final class FourthScreenCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {}

    func startWithMerchantId(parameters: Parameters) {
        let fourthScreenViewController = FourthScreenViewController.instantiateViewCode()
        fourthScreenViewController.viewModel.merchantId = parameters.merchantId
        fourthScreenViewController.viewModel.name = parameters.name
        self.navigationController.pushViewController(fourthScreenViewController, animated: true)
    }
    
    
}
extension ThirdScreenCoordinator: FlowFourthScreen {}

