//
//  LoadingModal.swift
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit

public class LoadingModal: BaseXib {

    @IBOutlet weak var backDrop: UIView!
    @IBOutlet private weak var titleLabel: SemiBoldLabel!
    
    public var title: String = "Loading..." {
        didSet {
            titleLabel.text = title
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
        backDrop.backgroundColor = .clear
        backDrop.applyBlurEffect()
    }
    
    public static func show(title: String = "Loading...") {
        let modal = LoadingModal(frame: UIScreen.main.bounds)
        modal.title = title
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(modal)
    }
    
    public static func dismiss() {
        if let subviews = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.subviews {
            for view in subviews {
                if view is LoadingModal {
                    view.removeFromSuperview()
               }
            }
        }
        
    }
}
