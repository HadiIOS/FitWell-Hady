//
//  BaseUtil.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import Foundation
import UIKit


class BaseUtil {
    static func showAlert(_ title: String, _ message: String? = nil, vc: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        vc.present(alertController, animated: true, completion: nil)
    }
}
