//
//  CustomCollectionViewCell.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(title: String, subtitle: String, right: String) {
        let titleLabel = TextLabel(frame: CGRect(x: 10, y: 5, width: 150, height: 25))
        titleLabel.configure(type: .subtitle)
        titleLabel.text = title
        self.addSubview(titleLabel)
        
        let subtitleLabel = TextLabel(frame: CGRect(x: 10, y: 35, width: 150, height: 25))
        subtitleLabel.configure(type: .normal)
        subtitleLabel.text = subtitle
        self.addSubview(subtitleLabel)
        
        let rightLabel = TextLabel(frame: CGRect(x: self.frame.width - 80, y: 5, width: 70, height: 25))
        rightLabel.configure(type: .normal)
        rightLabel.text = right
        rightLabel.textAlignment = .right
        self.addSubview(rightLabel)
        
        self.backgroundColor = .white
        self.setShadow()
    }
    
    func setShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.2
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
    }
    
}
