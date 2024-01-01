//
//  File.swift
//  
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//
import UIKit

public extension UIViewController {
    class func fromNib<T: UIViewController>() -> T {
        let vc = T(nibName: String(describing: T.self).replacingOccurrences(of: "Controller", with: ""), bundle: nil)
        return vc
    }
}
