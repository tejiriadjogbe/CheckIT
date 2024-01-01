//
//  BaseNavigationController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit
import Utilities

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        removeBackButtonTitle(for: viewController)
        super.pushViewController(viewController, animated: animated)
    }

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        viewControllers.forEach(removeBackButtonTitle(for:))
        super.setViewControllers(viewControllers, animated: animated)
    }
}

