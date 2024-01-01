//
//  ProfileCardViewModel.swift
//
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

public struct ProfileCardViewModel {
    var name: String
    var city: String
    var imgURL: String
    var commits: Int
    
    public init(name: String = "", city: String = "", imgURL: String = "", commits: Int = 0) {
        self.name = name
        self.city = city
        self.imgURL = imgURL
        self.commits = commits
    }
}
