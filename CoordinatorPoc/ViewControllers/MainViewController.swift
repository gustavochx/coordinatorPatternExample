//
//  MainViewController.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

public protocol MainFlow: class {
    func navigateToModuleViewController(name: String)
}

class MainViewController: UIViewController, Instantiabled {

    weak var flow: MainFlow?
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MainViewController"
    }

    @IBAction func onPressGoToViewModuleButton(_ sender: Any) {
        self.flow?.navigateToModuleViewController(name: nameTextField.text ?? "")
    }

}
