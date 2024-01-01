//
//  ImageDescriptionView.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//
import UIKit

@IBDesignable public class ImageDescriptionView: BaseXib {
    @IBOutlet weak var title: BoldLabel!
    @IBOutlet weak var subtitle: RegularLabel!
    @IBOutlet weak var image: UIImageView!
    
    
    @IBInspectable var titleText: String = "" {
        didSet { model.tilte = titleText }
    }
    
    @IBInspectable var subtitleText: String = "" {
        didSet { model.subtitle = subtitleText }
    }
    
    @IBInspectable var displayImage: UIImage = UIImage() {
        didSet { model.image = displayImage }
    }
    
    public var model: ImageDescriptionViewModel = ImageDescriptionViewModel() {
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
    
    public override  func awakeFromNib() {
        updateHeight()
    }
    
    func setup() {
        backgroundColor = .clear
        title.text = model.tilte
        subtitle.text = model.subtitle
        image.image = model.image
        updateHeight()
    }
}
