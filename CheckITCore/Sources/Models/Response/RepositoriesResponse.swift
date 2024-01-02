//
//  RepositoriesResponse.swift
//  
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation

public struct RepositoriesResponse: Codable {
    public var id: Int?
    public var full_name: String?
    public var description: String?
    public var owner: RepositoriesOwner?
}

public struct RepositoriesOwner: Codable {
    public var url: String?
    public var avatar_url: String?
    public var repos_url: String?
    //public var commits: Int = 100
}
