//
//  ExploreListViewController.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit
import Utilities
import Combine

class ExploreDetailViewController: BaseViewController {
    @IBOutlet weak var projectListView: ListView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var about: RegularLabel!
    @IBOutlet weak var profileCard: LargeProfileCardView!
    
    var coordinator: ExploreCoordinator?
    
    let vm = ExploreViewModel()
    let input = PassthroughSubject<ExploreViewModel.Input, Never>()
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupUI()
        input.send(.getUserRepo(vm.userData?.repos_url ?? ""))
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupUI() {
        scrollView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        setupSaveButton()
        about.text = vm.userData?.bio ?? "Nothin to see here :)"
        let profileModel = ProfileCardViewModel(
            name: vm.userData?.name ?? "",
            city: vm.userData?.location ?? "",
            imgURL: vm.userData?.avatar_url ?? "",
            commits: "\(Int.random(in: 1000...99999)) Commits"
        )
        profileCard.model = profileModel
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
        if let data = vm.userRepoData {
            var model = ListViewModel()
            model.count = 10
            model.height = 111
            model.showDivider = false
            model.cellForRowAt = { cell, index in
                let projectCard = ProjectCardView(frame: cell.bounds)
                let projectCardModel = ProjectCardModel(
                    name: data[index.row].name ?? "",
                    description: data[index.row].description ?? "Nothing to see here :)",
                    date: data[index.row].updated_at ?? ""
                )
                projectCard.model = projectCardModel
                cell.applyView(view: projectCard)
                return cell
            }
            model.onSelected = { _, _ in }
            projectListView.model = model
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension ExploreDetailViewController {
    func bind() {
        vm.transform(input: input)
        cancellable = vm.output.receive(on: DispatchQueue.main).sink {[weak self] event in
            switch event {
            case .getUserRepoSuccess:
                self?.initListView()
            case .getUserRepoFailed(let error):
                print(error)
                
            default: break
            }
        }
    }
}
