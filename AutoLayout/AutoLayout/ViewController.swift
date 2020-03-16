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
        
//        redView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor)
        
//        redView.anchor2(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, padding: .init(top: 15, left: 15, bottom: 15, right: 15), size: .init(width: 100, height: 100))
        
        self.setupView()
    }
    
    private func setupView() {
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        [redView, blueView, greenView].forEach{ view.addSubview($0)}
        
        redView.anchor2(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: CGSize(width: 100, height: 100))
        
        blueView.anchor2(top: redView.bottomAnchor, leading: nil, trailing: redView.trailingAnchor, bottom: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: CGSize(width: 100, height: 100))
        
        greenView.anchor2(top: redView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: redView.leadingAnchor, bottom: blueView.bottomAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
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
    
    func anchor2(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        // - with right and bottom
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
            
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
                
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

