//
//  ErrorResponse.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

public struct ErrorResponse: Error {
    var httpStatusCode: Int
    var message: String
    
    public init(httpStatusCode: Int = 0, message: String) {
        self.httpStatusCode = httpStatusCode
        self.message = message
    }
}
