//
//  AppHTTPClient.swift
//  CheckIT
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

class AppHTTPClient {
    public var requester: BasicHTTPClient
    
    public init() {
        requester = BasicHTTPClient.shared
    }
}
