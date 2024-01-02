//
//  ExploreViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit
import Utilities
import Models
import Combine

class ExploreViewController: BaseViewController {
    @IBOutlet weak var profileListView: ListView!
    
    var coordinator: ExploreCoordinator?
    let vm = ExploreViewModel()
    let input = PassthroughSubject<ExploreViewModel.Input, Never>()
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
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
            //self.coordinator?.goToExploreDetail()
            self.input.send(.getRepos)
        }
        profileListView.model = model
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension ExploreViewController {
    func bind() {
        vm.transform(input: input)
        cancellable = vm.output.sink { event in
            switch event {
            case .getReposSuccess(let data):
                print(data)
            case .getReposFailed(let error):
                print(error)
            }
        }
    }
}
