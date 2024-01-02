//
//  GithubServiceImpl.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation
import Models

public class GithubServiceImpl: GithubRepoService {
    let requester = AppHTTPClient().requester
    
    public init() {}
    
    public func getUser(url: String, completion: @escaping (Result<UserResponse, ErrorResponse>) -> Void) {
        requester.fetchData(url: url) {
            completion($0)
        }
    }
    
    public func getUserRepo(url: String, completion: @escaping (Result<[RepoResponse], ErrorResponse>) -> Void) {
        requester.fetchData(url: url) {
            completion($0)
        }
    }
    
    public func getRepositories(completion: @escaping (Result<[RepositoriesResponse], ErrorResponse>) -> Void) {
        requester.fetchData(url: "https://api.github.com/repositories") {
            completion($0)
        }
    }
}
