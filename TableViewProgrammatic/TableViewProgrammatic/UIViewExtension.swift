//
//  UIViewExtension.swift
//  TableViewProgrammatic
//
//  Created by arun-pt6232 on 31/01/23.
//

import UIKit

extension UIView {
    
    func pinToEdge(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints                               = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive                  = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive          = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive        = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive            = true
    }
}
