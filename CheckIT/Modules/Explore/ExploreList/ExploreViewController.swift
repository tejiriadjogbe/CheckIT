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
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var searchField: SearchInputView!
    @IBOutlet weak var profileListView: ListView!
    
    private var refreshControl = UIRefreshControl()
    var filteredRepositoriesData: [RepositoriesResponse]?
    
    var coordinator: ExploreCoordinator?
    let vm = ExploreViewModel()
    let input = PassthroughSubject<ExploreViewModel.Input, Never>()
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupPulltoRefresh()
        loadRepos()
        handleFilter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func loadRepos() {
        if vm.hasOfflineData() {
            initListView(with: vm.repositoriesData)
        } else {
            LoadingModal.show(title: "Loading Repositories...")
        }
        input.send(.getRepos)
    }
    
    func setupPulltoRefresh() {
        refreshControl.tintColor = .AppPrimary
        scrollview.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    func handleFilter() {
        searchField.textChanged = {[weak self] textField, range, string in
            let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            self?.filteredRepositoriesData = self?.vm.repositoriesData?.filter({
                if let name = $0.full_name?.lowercased() {
                    return name.contains(searchText.lowercased())
                }
                return false
            })
            
            if searchText.isEmpty {
                self?.initListView(with: self?.vm.repositoriesData)
            } else {
                self?.initListView(with: self?.filteredRepositoriesData)
            }
        }
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        loadRepos()
    }
    
    func initListView(with data: [RepositoriesResponse]?) {
        if let data = data {
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
                LoadingModal.show(title: "Fetching user details...")
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
            LoadingModal.dismiss()
            switch event {
            case .getReposSuccess:
                self?.refreshControl.endRefreshing()
                self?.initListView(with: self?.vm.repositoriesData)
            case .getReposFailed(let error):
                self?.refreshControl.endRefreshing()
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
