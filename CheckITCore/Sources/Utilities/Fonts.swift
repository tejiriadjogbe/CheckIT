//
//  Fonts.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

public enum Fonts: String {
    case Bold = "NunitoSans-Bold"
    case Regular = "NunitoSans-Regular"
    case SemiBold = "NunitoSans-SemiBold"
    
    public static func getFont(name: Fonts, _ size: CGFloat ) -> UIFont {
        UIFont(name: name.rawValue, size: size) ?? UIFont()
    }
}

//enum FontError: Error {
//  case invalidFontFile
//  case fontPathNotFound
//  case initFontError
//  case registerFailed
//}

extension UIFont {
    public static func loadAllFonts() {
        register(fileNameString: "NunitoSans-Bold", type: ".ttf")
        register(fileNameString: "NunitoSans-Regular", type: ".ttf")
        register(fileNameString: "NunitoSans-SemiBold", type: ".ttf")
    }
    
    static func register( fileNameString: String, type: String) {
        guard let resourceBundleURL = Bundle.module.path(forResource: fileNameString, ofType: type) else { return }
        guard let fontData = NSData(contentsOfFile: resourceBundleURL),let dataProvider = CGDataProvider.init(data: fontData) else { return }
        guard let fontRef = CGFont.init(dataProvider) else { return }
        var errorRef: Unmanaged<CFError>? = nil
        guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else { return }
     }
}


