//
//  ThirdScreenCoordinator.swift
//  CoordinatorPoc
//
//  Created by filipe on 08/04/21.
//

import UIKit

final class ThirdScreenCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}

    func startWithMerchantId(merchantId: String, name: String) {
        let thirdScreenViewController = ThirdScreenViewController.instantiateFrom(storyboardName: StoryboardName.storyboard)
        thirdScreenViewController.viewModel.merchantId = merchantId
        thirdScreenViewController.viewModel.name = name
        self.navigationController.pushViewController(thirdScreenViewController, animated: true)
    }
    
    
}
extension ThirdScreenCoordinator: FlowThirdScreen {
    //é realmente necessário?
    //verificar fluxos alternativos - exemplo modal
    func add(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func navigateToFourthViewController(parameterViewController: ParameterViewController) {
        let fourthScreenCoordinator = FourthScreenCoordinator(navigationController: self.navigationController)
        add(childCoordinator: fourthScreenCoordinator)
        let parameters = Parameters(merchantId: parameterViewController.merchantId, name: parameterViewController.name)
        fourthScreenCoordinator.startWithMerchantId(parameters: parameters)
    }
}
