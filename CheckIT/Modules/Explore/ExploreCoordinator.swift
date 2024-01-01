//
//  ExploreCoordinator.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//
import Utilities
import UIKit

class ExploreCoordinator: Coordinator {
    override func start() {
        goToExplore()
    }
    
    func goToExplore() {
        let vc: ExploreViewController = .fromNib()
        vc.coordinator = self
        navigationController = BaseNavigationController(rootViewController: vc)
        navigationController?.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = navigationController
    }
    
    func goToExploreDetail() {
        let vc: ExploreDetailViewController = .fromNib()
        vc.coordinator = self
        push(viewController: vc)
    }
    
}

