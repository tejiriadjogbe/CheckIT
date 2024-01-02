//
//  ProfileCardView.swift
//
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit
import SDWebImage

public class ProfileCardView: BaseXib {

    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var imageheghtConstrain: NSLayoutConstraint!
    @IBOutlet weak var commits: RegularLabel!
    @IBOutlet weak var commitsFul: SemiBoldLabel!
    @IBOutlet weak var email: RegularLabel!
    @IBOutlet weak var city: RegularLabel!
    @IBOutlet weak var name: SemiBoldLabel!
    @IBOutlet weak var image: UIImageView!
    
    public var model: ProfileCardViewModel = ProfileCardViewModel() {
        didSet {
            setup()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        image.layer.cornerRadius = image.bounds.height / 2
        email.isHidden = true
        commitsFul.isHidden = true
        image.sd_setImage(with: URL(string: model.imgURL), placeholderImage: UIImage())
        name.text = model.name
        city.text = model.city
        commits.text = model.commits
    }
}

