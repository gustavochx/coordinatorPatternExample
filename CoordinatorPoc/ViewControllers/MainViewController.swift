//
//  MainViewController.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit


public protocol MainFlow: class {
    func navigateToModuleViewController()

}

class MainViewController: UIViewController, Instantiabled {

    weak var flow: MainFlow?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MainViewController"
    }

    @IBAction func onPressGoToViewModuleButton(_ sender: Any) {
        self.flow?.navigateToModuleViewController()
    }

}
