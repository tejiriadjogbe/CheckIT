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
    
    enum Input {
        case getRepos
    }
    
    enum Output {
        case getReposFailed(ErrorResponse)
        case getReposSuccess([RepositoriesResponse])
    }
    
    var output = PassthroughSubject<Output, Never>()
    private var cancellables: Set<AnyCancellable> = []
    
    func transform(input: PassthroughSubject<Input, Never>) {
        let cancellable = input.sink { [weak self] event in
            switch event {
            case .getRepos:
                self?.getRepos()
            }
        }
        cancellable.store(in: &cancellables)
    }
    
    func getRepos() {
        exploreService.getAllRepo(completion: { result in
            switch result {
            case .success(let data):
                self.output.send(.getReposSuccess(data))
            case .failure(let error):
                self.output.send(.getReposFailed(error))
            }
        })
    }
}
