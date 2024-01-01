//
//  WelcomeViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit
//import Components
import Utilities

class WelcomeViewController: BaseViewController {
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var slider: Slider!
    
    var coordinator: AppCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }
    
    @IBAction func getStartedTapped(_ sender: Any) {
        coordinator?.goToExplore()
    }
    
    func setupSlider() {
        let sliderModels = [
            ImageDescriptionViewModel(
                tilte: "Welcome to CheckIT",
                subtitle: "Seamlessly Explore, Collaborate, and Elevate Your Projects",
                image: Assets.slider1.image),
            ImageDescriptionViewModel(
                tilte: "Exploring Possibilities",
                subtitle: "Navigate, Collaborate, and Create with CheckIT",
                image: Assets.slider2.image),
            ImageDescriptionViewModel(
                tilte: "Enhance Your GitHub Journey",
                subtitle: "Effortless Innovation and Collaboration Awaits with CheckIT",
                image: Assets.slider3.image)
        ]
        
        let views = sliderModels.map {
            let sliderPage = ImageDescriptionView(frame: slider.bounds)
            sliderPage.model = $0
            return sliderPage
        }
        
        slider.configure(with: views, pageControl: pageCtrl)
    }
}

