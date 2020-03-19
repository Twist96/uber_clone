//
//  Extensions.swift
//  UberClone
//
//  Created by Tochi on 17/03/2020.
//  Copyright © 2020 martins. All rights reserved.
//

import UIKit

extension UIView {
    
    func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        if let textField = textField{
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, marginLeft: 8, width: 24, height: 24)
            
            view.addSubview(textField)
            textField.centerY(inView: view)
            textField.anchor(left: imageView.rightAnchor, right: view.rightAnchor, marginLeft: 8)
        }
        
        if let segmentedControl = segmentedControl{
            imageView.anchor(left: view.leftAnchor, top: view.topAnchor, marginLeft: 8, marginTop: -8, width: 24, height: 24)
            
            view.addSubview(segmentedControl)
            segmentedControl.anchor(left: view.leftAnchor, right: view.rightAnchor, marginLeft: 8, marginRight: 8)
            segmentedControl.centerY(inView: view, constant: 8)
        }
        
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = .lightGray
        view.addSubview(seperatorView)
        seperatorView.anchor(left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, height: 0.75)
        
        return view
    }
    
    func anchor(left: NSLayoutXAxisAnchor? = nil,
                top: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                marginLeft: CGFloat = 0,
                marginTop: CGFloat = 0,
                marginRight: CGFloat = 0,
                marginBottom: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let left = left{
            leftAnchor.constraint(equalTo: left, constant: marginLeft).isActive = true
        }
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: marginTop).isActive = true
        }
        
        if let right = right{
            rightAnchor.constraint(equalTo: right, constant: -marginRight).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -marginBottom).isActive = true
        }
        
        if let width = width{
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }

}
