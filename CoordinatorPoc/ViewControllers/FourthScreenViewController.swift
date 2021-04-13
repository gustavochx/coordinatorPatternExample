//
//  FourthScreenViewController.swift
//  CoordinatorPoc
//
//  Created by filipe on 09/04/21.
//

import UIKit

public protocol FlowFourthScreen: class {}

final class FourthScreenViewController: UIViewController, Instantiabled  {
    
    public lazy var viewModel: ModuleViewModel = ModuleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "ViewCode"
        label()
    }
    
    
    func label() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = NSTextAlignment.center
        label.text = viewModel.name
        view.addSubview(label)
    }
}
