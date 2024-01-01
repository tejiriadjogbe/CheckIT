//
//  ExploreViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit
import Utilities

class ExploreViewController: BaseViewController {
    @IBOutlet weak var profileListView: ListView!
    
    var coordinator: ExploreCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        initListView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func initListView() {
        var model = ListViewModel()
        model.count = 10
        model.height = 92
        model.cellForRowAt = { cell, _ in
            let profileCard = ProfileCardView(frame: cell.bounds)
            cell.applyView(view: profileCard)
            return cell
        }
        model.onSelected = { _, _ in
            self.coordinator?.goToExploreDetail()
        }
        profileListView.model = model
    }
}
