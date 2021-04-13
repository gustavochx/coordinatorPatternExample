//
//  Instantiated.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique Frota Soares on 12/03/21.
//

import UIKit

protocol Instantiabled: class {
    static func instantiate() -> Self
}

extension Instantiabled where Self: UIViewController {

    static func instantiate() -> Self {
        let name = String(describing: self)
        let bundle = Bundle(for: self)
        return Self(nibName: name, bundle: bundle)
    }
    
    static func instantiateViewCode() -> Self {
        return Self(nibName: nil, bundle: nil)
    }

    static func instantiateFrom(storyboardName: String) -> Self {
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: Self.reusableIdentifier) as! Self
    }
}
