//
//  EmailViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 15/10/2020.
//

import UIKit

class EmailViewController: UIViewController {
    
    var serviceName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "lightgray")
        
        let title = TextLabel(frame: CGRect(x: 0, y: 55, width: self.view.frame.width, height: 30))
        title.text = serviceName
        title.configure(type: .title)
        self.view.addSubview(title)
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        let hourLabel = TextLabel(frame: CGRect(x: 0, y: title.frame.origin.y + title.frame.height + 10, width: self.view.frame.width, height: 30))
        hourLabel.text = "\(hour)h\(minutes)"
        hourLabel.configure(type: .title)
        hourLabel.font = UIFont(name: "Poppins-Bold", size: 23)
        self.view.addSubview(hourLabel)
        
        let dateLabel = TextLabel(frame: CGRect(x: 0, y: hourLabel.frame.origin.y + hourLabel.frame.height + 10, width: self.view.frame.width, height: 30))
        dateLabel.text = "\(day)/\(month)/\(year)"
        dateLabel.configure(type: .normal)
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "Poppins-Regular", size: 23)
        self.view.addSubview(dateLabel)
        
        let input1 = Input(frame: CGRect(x: 30, y: 200, width: self.view.frame.width - 60, height: 50))
        input1.placeholder = "Nom"
        self.view.addSubview(input1)
        
        let input2 = Input(frame: CGRect(x: 30, y: 275, width: self.view.frame.width - 60, height: 50))
        input2.placeholder = "Prénom"
        self.view.addSubview(input2)
        
        let input3 = Input(frame: CGRect(x: 30, y: 350, width: self.view.frame.width - 60, height: 50))
        input3.placeholder = "Adresse Mail"
        self.view.addSubview(input3)
        
        let registerBtn = MainButton(frame: CGRect(x: 30, y: (self.view.frame.height / 2), width: self.view.frame.width - 60, height: 52))
        registerBtn.setTitle("Continuer", for: .normal)
        registerBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerUser)))
        self.view.addSubview(registerBtn)
        
        let label2 = TextLabel(frame: CGRect(x: 32, y: registerBtn.frame.height + registerBtn.frame.origin.y, width: self.view.frame.width - 60, height: 50))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Je souhaite m'enregistrer par téléphone", attributes: underlineAttribute)
        label2.attributedText = underlineAttributedString
        label2.configure(type: .normal)
        label2.textAlignment = .center
        label2.font = UIFont(name: "Poppins-Regular", size: 13)
        label2.isUserInteractionEnabled = true
        label2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(back)))
        self.view.addSubview(label2)
        
        let nurseImg = UIImageView(image: UIImage(named: "nurse"))
        nurseImg.frame = CGRect(x: -self.view.frame.width/4, y: self.view.frame.height - 300, width: self.view.frame.width, height: self.view.frame.width)
        self.view.addSubview(nurseImg)
        
        self.addBackBtn()
        self.addHideKeyboard()
    }
    
    @objc func registerUser(_ sender: UIView) {
        let ac = UIAlertController(title: "MERCI !", message: "Votre contact a bien été enregistré", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        present(ac, animated: true, completion: nil)
    }

}
