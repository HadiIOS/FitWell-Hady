//
//  NavigationViewController.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupTitleFont() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
    }

    func setupBarButtons() {
        let rightImage = #imageLiteral(resourceName: "Search").withRenderingMode(.alwaysOriginal)
        let leftImage = #imageLiteral(resourceName: "Back").withRenderingMode(.alwaysOriginal)
        
        let rightButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 24, height: 24)))
        rightButton.setImage(rightImage, for: .normal)
        rightButton.addTarget(self, action: #selector(self.rightAction), for: .touchUpInside)
        
        let leftButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 24, height: 24)))
        leftButton.setImage(leftImage, for: .normal)
        leftButton.addTarget(self, action: #selector(self.leftAction), for: .touchUpInside)
        
        let rightBar = UIBarButtonItem(customView: rightButton)
        rightBar.customView?.widthAnchor.constraint(equalToConstant: 18).isActive = true
        rightBar.customView?.heightAnchor.constraint(equalToConstant: 18).isActive = true

        let leftBar = UIBarButtonItem(customView: leftButton)
        leftBar.customView?.widthAnchor.constraint(equalToConstant: 18).isActive = true
        leftBar.customView?.heightAnchor.constraint(equalToConstant: 18).isActive = true

        self.navigationItem.rightBarButtonItem = rightBar
        self.navigationItem.leftBarButtonItem = leftBar
    }
    
    
    @objc func rightAction() { }
    
    @objc func leftAction() { }
}

extension UIView {
    func roundedView(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addBorder(_ width: CGFloat = 1.0) {
        self.layer.borderWidth = width
        self.layer.borderColor = UIColor.white.cgColor
    }
}

extension Date {
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
}

