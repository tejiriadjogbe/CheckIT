//
//  AppCoordinator.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import Foundation
import Utilities

final class AppCoordinator: Coordinator {
    
    override func start() {
        if AppStorage.isFirstTime ?? false {
            goToExplore()
        } else {
            goToWelcome()
        }
    }
    
    func goToWelcome() {
        let vc: WelcomeViewController = .fromNib()
        vc.coordinator = self
        push(viewController: vc)
    }
    
    func goToExplore() {
        let exploreCoordinator = ExploreCoordinator(parentCoordinator: self)
        exploreCoordinator.start()
    }
}
