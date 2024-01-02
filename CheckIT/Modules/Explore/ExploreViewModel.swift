//
//  ExploreViewModel.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation
import Combine
import Network
import Models

class ExploreViewModel {
    var exploreService: GithubServiceImpl = GithubServiceImpl()
    var repositoriesData: [RepositoriesResponse]?
    var userData: UserResponse?
    var userRepoData: [RepoResponse]?
    
    enum Input {
        case getRepos
        case getUser(String)
        case getUserRepo(String)
    }
    
    enum Output {
        case getReposFailed(ErrorResponse)
        case getReposSuccess
        
        case getUserFailed(ErrorResponse)
        case getUserSuccess
        
        case getUserRepoFailed(ErrorResponse)
        case getUserRepoSuccess
    }
    
    var output = PassthroughSubject<Output, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    func transform(input: PassthroughSubject<Input, Never>) {
        let cancellable = input.sink { [weak self] event in
            switch event {
            case .getRepos:
                self?.getRepos()
            case .getUserRepo(let url):
                self?.getUserRepo(url: url)
            case .getUser(let url):
                self?.getUser(url: url)
            }
        }
        cancellable.store(in: &cancellables)
    }
    
    func getRepos() {
        exploreService.getRepositories {[weak self] result in
            switch result {
            case .success(let data):
                self?.repositoriesData = data
                self?.output.send(.getReposSuccess)
            case .failure(let error):
                self?.output.send(.getReposFailed(error))
            }
        }
    }
    
    func getUser(url: String) {
        exploreService.getUser(url: url) {[weak self] result in
            switch result {
            case .success(let data):
                self?.userData = data
                self?.output.send(.getUserSuccess)
            case .failure(let error):
                self?.output.send(.getReposFailed(error))
            }
        }
    }
    
    func getUserRepo(url: String) {
        exploreService.getUserRepo(url: url) {[weak self] result in
            switch result {
            case .success(let data):
                self?.userRepoData = data
                self?.output.send(.getUserRepoSuccess)
            case .failure(let error):
                self?.output.send(.getReposFailed(error))
            }
        }
    }
}
