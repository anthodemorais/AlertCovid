//
//  PhoneInput.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 15/10/2020.
//

import UIKit

class PhoneInput: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    func configure() {
        self.borderStyle = .none
        self.font = UIFont(name: "Poppins-Bold", size: 25)
        self.textAlignment = .center
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor(named: "lightblue")!.cgColor
        self.layer.addSublayer(bottomLine)
    }

}
