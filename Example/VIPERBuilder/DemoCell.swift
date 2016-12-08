//
//  DemoCell.swift
//
//  Created by Mike MacDougall on 1/20/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

import UIKit

class DemoCell: UICollectionViewCell {
    private let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        
        let horizConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["label": label])
        NSLayoutConstraint.activate(horizConstraints)
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["label": label])
        NSLayoutConstraint.activate(vertConstraints)
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    func setTitleColor(color: UIColor) {
        label.textColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
