//
//  MainViewController.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit


public protocol MainViewControllerDelegate: class {
    func navigateToModuleViewController()
}

class MainViewController: UIViewController, ReusableView {

    weak var delegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MainViewController"
    }

    @IBAction func onPressGoToViewModuleButton(_ sender: Any) {
        self.delegate?.navigateToModuleViewController()
    }

}
