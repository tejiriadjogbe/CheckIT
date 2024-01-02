//
//  ExploreCoordinator.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//
import Utilities
import Models
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
    
    func goToExploreDetail(userData: UserResponse) {
        let vc: ExploreDetailViewController = .fromNib()
        vc.vm.userData = userData
        vc.coordinator = self
        push(viewController: vc)
    }
    
}

