//
//  SearchInputView.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import UIKit

@IBDesignable public class SearchInputView: UITextField {
    
    @IBInspectable public var placeHolder: String = "" {
        didSet {
            placeholder = placeHolder
            attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.AppBackground.cgColor])
        }
    }
    
    public var textChanged: (UITextField, NSRange, String) -> Void = { _, _, _ in }
    
    public var model: SearchInputViewModel = SearchInputViewModel() {
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
        setup()
    }
    
    func setup() {
        delegate = self
        backgroundColor = .clear
        layer.borderColor = UIColor.AppOutline.cgColor
        layer.borderWidth = 1
        borderStyle = .none
        layer.cornerRadius = 12
        font = Fonts.getFont(name: .Regular, 14)
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: frame.height))
        rightViewMode = .always
        rightView = getImage(image: Assets.filter.image)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: frame.height))
        leftViewMode = .always
        leftView = getImage(image: Assets.search.image, isLeft: true)
    }
    
    func getImage(image: UIImage, isLeft: Bool = false) -> UIView {
        let iconContainer = UIView(frame: CGRect(x: 0, y: 0, width: isLeft ? 40 : 32, height: 18))
        let imageView = UIImageView(frame: CGRect(x: isLeft ? 16 : 0, y: 0, width: 18, height: 18))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        iconContainer.addSubview(imageView)
        return iconContainer
    }
}

extension SearchInputView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textChanged(textField, range, string)
        return true
    }
}
