//
//  ProjectCardView.swift
//
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit

public class ProjectCardView: BaseXib {
    @IBOutlet weak var parentView: UIView!
    
//    public var model: ProjectCardViewModel = ProfileCardViewModel() {
//        didSet {
//            setup()
//        }
//    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        parentView.layer.borderColor = UIColor.AppOutline.cgColor
        parentView.layer.borderWidth = 1
        parentView.layer.cornerRadius = 10
        parentView.backgroundColor = .clear
    }
}

