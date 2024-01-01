//
//  BaseViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit
import Utilities

class BaseViewController: UIViewController {
    let navigationBarAppearance = UINavigationBarAppearance()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.setBackIndicatorImage(Assets.backSpaced.image, transitionMaskImage: Assets.backSpaced.image)
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.backgroundImage = nil
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        navigationBarAppearance.titleTextAttributes = [
            .font: Fonts.getFont(name: .Bold, 20),
            .foregroundColor: UIColor.black,
            ]
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.backIndicatorImage = Assets.backSpaced.image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = Assets.backSpaced.image
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.shadowColor = .clear
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(-4.5, for: .default)
        
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        setTitleAllignment()
    }
    
    func setTitleAllignment() {
        let label = UILabel()
        label.text = navigationItem.title
        label.textAlignment = .left
        label.font = Fonts.getFont(name: .Bold, 20)
        label.frame = .infinite
        self.navigationItem.titleView = label
    }
}
