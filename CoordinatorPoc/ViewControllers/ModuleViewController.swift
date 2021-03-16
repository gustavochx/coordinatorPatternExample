//
//  ModuleViewController.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique Frota Soares on 11/03/21.
//

import UIKit
import Security


public protocol BackToMainFlowDelegate: class {
    func backToMainModule()
}

class ModuleViewController: UIViewController, Instantiabled {

    public weak var delegate: BackToMainFlowDelegate?
    public lazy var viewModel: ModuleViewModel = ModuleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ModuleViewController"

    }

    private func createBarButtomItem() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainApp))
        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backToMainApp() {
        self.delegate?.backToMainModule()
    }

}
