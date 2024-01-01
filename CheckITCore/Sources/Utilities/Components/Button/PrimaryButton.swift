//
//  PrimaryButton.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

@IBDesignable public class PrimaryButton: UIButton {
    
    public override func awakeFromNib() {
        setUp()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        backgroundColor = UIColor.AppTetiary
        layer.cornerRadius = 12.0
        setTitleColor(.AppHeadline, for: .normal)
        titleLabel?.font = Fonts.getFont(name: .Bold, 16)
        layer.shadowColor = UIColor.AppHeadline.cgColor
        layer.shadowRadius = 15
        layer.shadowOffset = CGSize(width: 5, height: 3)
        layer.shadowOpacity = 0.15
    }
}
