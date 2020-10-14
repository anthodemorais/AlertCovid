//
//  TitleLabel.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class TextLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(type: BtnType) {
        switch type {
            case .title:
                self.font = UIFont(name: "Poppins-Bold", size: 25)
            case .subtitle:
                self.font = UIFont(name: "Poppins-SemiBold", size: 20)
            case .normal:
                self.font = UIFont(name: "Poppins-Regular", size: 17)
        }
    }

}

enum BtnType {
    case title
    case subtitle
    case normal
}
