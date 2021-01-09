//
//  UIView+extension.swift
//  Milestone_25-27
//
//  Created by Баир Надцалов on 07.01.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func autoPinEdgesToSuperviewEdges(with insets: UIEdgeInsets = .zero) {
        guard let sv = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: sv.leftAnchor, constant: insets.left).isActive = true
        rightAnchor.constraint(equalTo: sv.rightAnchor, constant: insets.right).isActive = true
        topAnchor.constraint(equalTo: sv.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: insets.bottom).isActive = true
    }
}
