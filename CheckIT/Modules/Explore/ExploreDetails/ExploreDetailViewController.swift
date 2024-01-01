//
//  ExploreListViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit
import Utilities

class ExploreDetailViewController: BaseViewController {
    @IBOutlet weak var projectListView: ListView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var coordinator: ExploreCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSaveButton()
        initListView()
        scrollView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupSaveButton() {
        let saveButton = UIButton(type: .system)
        saveButton.setImage(Assets.save.image, for: .normal)
        saveButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
    }
    
    @objc func saveButtonTapped() {
        print("You tapped the save button")
    }
    
    func initListView() {
        var model = ListViewModel()
        model.count = 10
        model.height = 111
        model.showDivider = false
        model.cellForRowAt = { cell, _ in
            let projectCard = ProjectCardView(frame: cell.bounds)
            cell.applyView(view: projectCard)
            return cell
        }
        model.onSelected = { _, _ in }
        projectListView.model = model
    }
}
