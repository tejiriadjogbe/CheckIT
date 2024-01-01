//
//  Images.swift
//
//
//  Created by Adjogbe  Tejiri on 30/12/2023.
//

import UIKit

public enum Assets: String {
    case back = "back"
    case backSpaced = "back_spaced"
    case bell = "bell"
    case folder = "folder"
    case logo = "logo"
    case save = "save"
    case search = "search"
    case slider1 = "slider1"
    case slider2 = "slider2"
    case slider3 = "slider3"
    case filter = "filter"
    
    public var image: UIImage {
        UIImage(named: self.rawValue, in: .module, with: nil) ?? UIImage()
    }
}

public class CheckITImageView: UIImageView {

}
