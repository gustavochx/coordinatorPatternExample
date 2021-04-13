//
//  ThirdScreenViewController.swift
//  CoordinatorPoc
//
//  Created by filipe on 08/04/21.
//

import UIKit

public protocol BackToSecondScreenDelegate: class {
    func backToSecondModule()
}

public protocol FlowThirdScreen: class {
    func navigateToFourthViewController(parameterViewController: ParameterViewController)
}

final class ThirdScreenViewController: UIViewController, Instantiabled {
  
    public weak var delegate: BackToSecondScreenDelegate?
    public lazy var viewModel: ModuleViewModel = ModuleViewModel()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nextScreenButton: UIButton!
    weak var flow: FlowThirdScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        nextScreenButton.setTitle("viewCode Screen", for: .normal)
        title = "Storyboard"
        nameLabel.text = viewModel.name
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let parameterViewController = ParameterViewController(merchantId: viewModel.merchantId ?? "", name: viewModel.name ?? "")
        self.flow?.navigateToFourthViewController(parameterViewController: parameterViewController)
    }
}
