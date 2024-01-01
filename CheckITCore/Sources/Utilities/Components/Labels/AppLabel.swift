//
//  AppLabel.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

public class AppLabel: UILabel {
    public override func awakeFromNib() {
        setup()
    }
    
    func setup() {}
}



public class BoldLabel: AppLabel {

    @IBInspectable public var size: CGFloat = 24 {
        didSet {
            setup(size)
        }
    }
    
    public override func awakeFromNib() {
        setup()
        super.awakeFromNib()
    }

    func setup(_ size: CGFloat = 24) {
        font = Fonts.getFont(name: .Bold, size)
    }
    
}



public class SemiBoldLabel: AppLabel {

    @IBInspectable public var size: CGFloat = 20 {
        didSet {
            setup(size)
        }
    }

    public override func awakeFromNib() {
        setup()
        super.awakeFromNib()
    }

    func setup(_ size: CGFloat = 20) {
        font = Fonts.getFont(name: .SemiBold, size)
    }
}


public class RegularLabel: AppLabel {

    @IBInspectable public var size: CGFloat = 13 {
        didSet {
            setup(size)
        }
    }
    
    public override func awakeFromNib() {
        setup()
        super.awakeFromNib()
    }

    func setup(_ size: CGFloat = 13) {
        font = Fonts.getFont(name: .Regular, size)
    }
}
