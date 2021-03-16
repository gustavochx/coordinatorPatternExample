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
        return Self(nibName: Self.reusableIdentifier, bundle: .main)
    }

}
