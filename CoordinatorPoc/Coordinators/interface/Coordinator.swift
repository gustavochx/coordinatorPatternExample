//
//  Coordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set}

    init(navigationController: UINavigationController)

    func start()
}


