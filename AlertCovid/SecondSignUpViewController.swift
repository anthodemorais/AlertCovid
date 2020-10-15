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
        
        self.view.backgroundColor = .white

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
        
        let label2 = TextLabel(frame: CGRect(x: 32, y: self.view.frame.height - 110, width: self.view.frame.width - 60, height: 50))
        label2.text = "Vous avez déjà un compte ? Connexion"
        label2.configure(type: .normal)
        label2.textAlignment = .center
        label2.font = UIFont(name: "Poppins-Regular", size: 14)

        self.view.addSubview(label2)
        
        self.addBackBtn()
        self.addBackgroundImage()
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
