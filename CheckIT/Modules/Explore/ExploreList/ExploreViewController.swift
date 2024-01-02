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
import SDWebImage

class ExploreViewController: BaseViewController {
    @IBOutlet weak var profileListView: ListView!
    
    var coordinator: ExploreCoordinator?
    let vm = ExploreViewModel()
    let input = PassthroughSubject<ExploreViewModel.Input, Never>()
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        input.send(.getRepos)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func initListView() {
        if let data = vm.repositoriesData {
            var model = ListViewModel()
            model.count = data.count
            model.height = 92
            model.cellForRowAt = { cell, index in
                let profileCard = ProfileCardView(frame: cell.bounds)
                let cardModel = ProfileCardViewModel(
                    name: data[index.row].full_name?.formatName() ?? "",
                    city: data[index.row].description ?? "",
                    imgURL: data[index.row].owner?.avatar_url ?? "",
                    commits: "\(Int.random(in: 10...99))K"
                )
                profileCard.model = cardModel
                cell.applyView(view: profileCard)
                return cell
            }
            model.onSelected = { [weak self] _, index in
                let userUrl = data[index.row].owner?.url
                self?.input.send(.getUser(userUrl ?? ""))
            }
            profileListView.model = model
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension ExploreViewController {
    func bind() {
        vm.transform(input: input)
        cancellable = vm.output.receive(on: DispatchQueue.main).sink {[weak self] event in
            switch event {
            case .getReposSuccess:
                self?.initListView()
            case .getReposFailed(let error):
                print(error)
                
            case .getUserSuccess:
                if let data = self?.vm.userData {
                    self?.coordinator?.goToExploreDetail(userData: data)
                }
            case .getUserFailed(let error):
                print(error)
                
            default: break
            }
        }
    }
}
