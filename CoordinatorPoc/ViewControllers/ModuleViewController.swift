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

public protocol FlowModuleCoordinatorDelegate: class {
    func navigateToThirdViewController(name: String)
}


class ModuleViewController: UIViewController, Instantiabled {

    public weak var delegate: BackToMainFlowDelegate?
    public lazy var viewModel: ModuleViewModel = ModuleViewModel()
    weak var flow: FlowModuleCoordinatorDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ModuleViewController"
        nextPageButton.setTitle("Next Page", for: .normal)
        nameLabel.text = viewModel.name
    }

    private func createBarButtomItem() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToMainApp))
        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backToMainApp() {
        self.delegate?.backToMainModule()
    }

    @IBAction func nextPage(_ sender: Any) {
        self.flow?.navigateToThirdViewController(name: viewModel.name ?? "")
    }
}
