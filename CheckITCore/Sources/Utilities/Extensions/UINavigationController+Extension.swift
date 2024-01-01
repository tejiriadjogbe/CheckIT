//
//  UINavigationController+Extension.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

public extension UINavigationController {
    
    func removeBackButtonTitle(for viewController: UIViewController) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    }
    
}
