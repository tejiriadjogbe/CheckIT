//
//  LargeProfileCardView.swift
//  
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit

@IBDesignable public class LargeProfileCardView: ProfileCardView {
    override func setup() {
        super.setup()
        email.isHidden = false
        commitsFul.isHidden = false
        leftStack.isHidden = true
        imageheghtConstrain.constant = 89
        name.font = Fonts.getFont(name: .Bold, 16)
        city.font = Fonts.getFont(name: .Regular, 12)
        image.layer.cornerRadius = 89/2
        mainStack.spacing = 19
    }
    
    override func getNibName() -> String? {
        "ProfileCardView"
    }
}
