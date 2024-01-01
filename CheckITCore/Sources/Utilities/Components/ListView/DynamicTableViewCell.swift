//
//  DynamicTableViewCell.swift
//
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//
import UIKit

public class DynamicTableViewCell: UITableViewCell {

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func applyView(view: UIView){
        contentView.subviews.forEach({ $0.removeFromSuperview() })
        contentView.addSubview(view)
    }
}

