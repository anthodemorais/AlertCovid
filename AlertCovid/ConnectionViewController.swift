//
//  ConnectionViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class ConnectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "lightgray")
        
        let image = UIImageView(frame: CGRect(x: (self.view.frame.width / 2) - 110 , y: 90, width: 220, height: 110))
        image.image = UIImage(named: "Alert_Covid")
        self.view.addSubview(image)
                
        
        let input1 = Input(frame: CGRect(x: 30, y: 255, width: self.view.frame.width - 60, height: 50))
        input1.placeholder = "N° de commerce"
        self.view.addSubview(input1)
        
        let input2 = Input(frame: CGRect(x: 30, y: 330, width: self.view.frame.width - 60, height: 50))
        input2.placeholder = "Mot de passe"
        input2.isSecureTextEntry = true
        self.view.addSubview(input2)
        
        let label1 = TextLabel(frame: CGRect(x: 32, y: 370, width: self.view.frame.width - 60, height: 50))
        label1.text = "Mot de passe oublié ?"
        label1.configure(type: .normal)
        label1.font = UIFont(name: "Poppins-Regular", size: 10)
        self.view.addSubview(label1)
        

        let connectionBtn = MainButton(frame: CGRect(x: 30, y: (self.view.frame.height / 2) + 40, width: self.view.frame.width - 60, height: 52))
        connectionBtn.setTitle("Continuer", for: .normal)
        connectionBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToServices)))
        self.view.addSubview(connectionBtn)
        
        let label2 = TextLabel(frame: CGRect(x: 5, y: self.view.frame.height - 110, width: self.view.frame.width - 60, height: 50))
        label2.text = "Vous n’avez pas de compte ?"
        label2.configure(type: .normal)
        label2.textAlignment = .center
        self.view.addSubview(label2)
        
        let createBtn = UIButton(frame: CGRect(x: label2.frame.origin.x + label2.frame.width - 50, y: self.view.frame.height - 111, width: 50, height: 50))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineString = NSAttributedString(string: "Créer", attributes: underlineAttribute)
        createBtn.setAttributedTitle(underlineString, for: .normal)
        createBtn.setTitleColor(UIColor(named: "red"), for: .normal)
        createBtn.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 17)
        self.view.addSubview(createBtn)
        createBtn.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        
        self.addBackBtn()
        self.addBackgroundImage()
        self.addHideKeyboard()
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToRegister() {
        let vc = FirstSignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

extension UIViewController {
    
    func addBackBtn() {
        let backBtn = BackButton()
        self.view.addSubview(backBtn)
        backBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(back)))
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 25),
            backBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addBackgroundImage() {
        let background = UIImageView(image: UIImage(named: "background"))
        background.frame = self.view.frame
        self.view.addSubview(background)
        background.layer.zPosition = -1
    }
    
}

extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func addHideKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
}
