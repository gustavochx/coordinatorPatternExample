//
//  FourthScreenCoordinator.swift
//  CoordinatorPoc
//
//  Created by filipe on 09/04/21.
//


import UIKit

class FourthScreenCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    public lazy var viewModel: ModuleViewModel = ModuleViewModel()

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {}

    func startWithMerchantId(merchantId: String, name: String) {
        let fourthScreenViewController = FourthScreenViewController.instantiateViewCode(nibName: nil)
        fourthScreenViewController.viewModel.merchantId = merchantId
        fourthScreenViewController.viewModel.name = name
        self.navigationController.pushViewController(fourthScreenViewController, animated: true)
    }
    
    
}
extension ThirdScreenCoordinator: FlowFourthScreen {}

