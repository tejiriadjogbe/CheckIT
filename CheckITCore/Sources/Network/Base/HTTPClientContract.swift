//
//  File.swift
//  
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import Foundation
import Models

public protocol HTTPClientContract {
    func fetchData<T: Codable>(
        url: String,
        data: Codable?,
        method: HTTPMethod,
        completion: @escaping (Result<T, ErrorResponse>) -> Void)
}
