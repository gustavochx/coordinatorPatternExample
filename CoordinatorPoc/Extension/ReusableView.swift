//
//  ReusableView.swift
//  CoordinatorPoc
//
//  Created by Gustavo Henrique on 11/03/21.
//

import UIKit

protocol ReusableView  {}

extension ReusableView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
