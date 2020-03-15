//
//  ViewController.swift
//  AutoLayout
//
//  Created by Trinh Thai on 3/15/20.
//  Copyright © 2020 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, trailing: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, padding: UIEdgeInsets = .zero) {
        // (important) enables auto layout
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top).isActive = true
        leadingAnchor.constraint(equalTo: leading).isActive = true
        trailingAnchor.constraint(equalTo: trailing).isActive = true
        bottomAnchor.constraint(equalTo: bottom).isActive = true
    }
}

