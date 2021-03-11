//
//  Coordinator.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

protocol Coordinator: class {

    var delegate: AppDelegate? { get set }
    var window : UIWindow { get set }

    func start()
    init(delegate:AppDelegate,window: UIWindow)
}


