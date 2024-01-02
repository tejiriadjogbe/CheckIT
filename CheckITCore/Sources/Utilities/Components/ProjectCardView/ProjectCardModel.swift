//
//  ProjectCardModel.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation

public struct ProjectCardModel {
    public var name: String
    public var description: String
    public var date: String
    
    public init(name: String = "", description: String = "", date: String = "") {
        self.name = name
        self.description = description
        self.date = date
    }
}
