//
//  MainButton.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class MainButton: UIButton {
    
    var isGrey = false {
        didSet {
            self.backgroundColor = UIColor(named: "gray")
        }
    }
    
    var isWhite = false {
        didSet {
            self.backgroundColor = UIColor.white
            self.setTitleColor(.black, for: .normal)
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureButton()
    }
    
    func configureButton() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(named: "red")
        self.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 20)
        self.setTitleColor(.white, for: .normal)
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
