//
//  GithubRepoService.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation
import Models

public protocol GithubRepoService {
    func getAllRepo(completion: @escaping (Result<[RepositoriesResponse], ErrorResponse>) -> Void)
}
