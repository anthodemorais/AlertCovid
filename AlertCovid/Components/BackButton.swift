//
//  BackButton.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class BackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureBtn()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureBtn()
    }
    
    func configureBtn() {
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        self.tintColor = UIColor(named: "gray")
        self.isUserInteractionEnabled = true
    }

}
