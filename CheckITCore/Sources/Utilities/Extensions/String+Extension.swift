//
//  String+Extension.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

public extension String {
    func formatName() -> String {
        self.replacingOccurrences(of: "/", with: " ").capitalized
    }
}
