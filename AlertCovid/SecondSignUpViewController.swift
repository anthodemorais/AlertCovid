//
//  SecondSignUpViewController.swift
//  AlertCovid
//
//  Created by Eliott Jarmoiune on 14/10/2020.
//

import UIKit

class SecondSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "lightgray")

        let image = UIImageView(frame: CGRect(x: (self.view.frame.width / 2) - 110 , y: 90, width: 220, height: 110))
        image.image = UIImage(named: "Alert_Covid")
        self.view.addSubview(image)
                
        let input1 = Input(frame: CGRect(x: 30, y: 250, width: self.view.frame.width - 60, height: 50))
        input1.placeholder = "Nom d’établissement"
        self.view.addSubview(input1)
        
        let input2 = Input(frame: CGRect(x: 30, y: 325, width: self.view.frame.width - 60, height: 50))
        input2.placeholder = "N° de commerce"
        self.view.addSubview(input2)
        
        let input3 = Input(frame: CGRect(x: 30, y: 400, width: self.view.frame.width - 60, height: 50))
        input3.placeholder = "Adresse"
        self.view.addSubview(input3)
        

        let connectionBtn = MainButton(frame: CGRect(x: 30, y: (self.view.frame.height / 2) + 100, width: self.view.frame.width - 60, height: 52))
        connectionBtn.setTitle("Continuer", for: .normal)
        connectionBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToServices)))
        self.view.addSubview(connectionBtn)
        
        let label = TextLabel(frame: CGRect(x: 0, y: self.view.frame.height - 110, width: self.view.frame.width - 90, height: 50))
        label.text = "Vous avez déjà un compte ?"
        label.configure(type: .normal)
        label.textAlignment = .center
        self.view.addSubview(label)
        
        let createBtn = UIButton(frame: CGRect(x: label.frame.origin.x + label.frame.width - 45, y: self.view.frame.height - 111, width: 100, height: 50))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineString = NSAttributedString(string: "Connexion", attributes: underlineAttribute)
        createBtn.setAttributedTitle(underlineString, for: .normal)
        createBtn.setTitleColor(UIColor(named: "red"), for: .normal)
        createBtn.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 17)
        self.view.addSubview(createBtn)
        createBtn.addTarget(self, action: #selector(goToConnection), for: .touchUpInside)
        
        self.addBackBtn()
        self.addBackgroundImage()
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToConnection() {
        let vc = ConnectionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
