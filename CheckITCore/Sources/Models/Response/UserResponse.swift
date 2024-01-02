//
//  UserResponse.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation

public struct UserResponse: Codable {
    public var name: String?
    public var email: String?
    public var location: String?
    public var avatar_url: String?
    public var bio: String?
    public var repos_url: String?
}
