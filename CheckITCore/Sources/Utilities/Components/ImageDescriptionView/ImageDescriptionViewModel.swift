//
//  ImageDescriptionViewModel.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//
import UIKit

public struct ImageDescriptionViewModel {
    var tilte: String
    var subtitle: String
    var image: UIImage
    
    public init(tilte: String = "", subtitle: String = "", image: UIImage = UIImage()) {
        self.tilte = tilte
        self.subtitle = subtitle
        self.image = image
    }
}
