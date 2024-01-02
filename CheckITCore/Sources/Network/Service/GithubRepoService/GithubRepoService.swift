//
//  GithubRepoService.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation
import Models

public protocol GithubRepoService {
    func getRepositories(completion: @escaping (Result<[RepositoriesResponse], ErrorResponse>) -> Void)
    func getUser(url: String, completion: @escaping (Result<UserResponse, ErrorResponse>) -> Void)
    func getUserRepo(url: String, completion: @escaping (Result<[RepoResponse], ErrorResponse>) -> Void)
}
