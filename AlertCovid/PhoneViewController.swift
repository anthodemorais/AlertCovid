//
//  PhoneViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 15/10/2020.
//

import UIKit

class PhoneViewController: UIViewController {
    
    var serviceName: String?
    var phone = ""
    
    var phone1 = PhoneInput()
    var phone2 = PhoneInput()
    var phone3 = PhoneInput()
    var phone4 = PhoneInput()
    var phone5 = PhoneInput()

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
        
        let inputLabel = TextLabel(frame: CGRect(x: 30, y: dateLabel.frame.origin.y + dateLabel.frame.height + 50, width: 200, height: 25))
        inputLabel.text = "Téléphone"
        inputLabel.configure(type: .subtitle)
        inputLabel.textAlignment = .left
        self.view.addSubview(inputLabel)
        
        let width = ((self.view.frame.width - 60) - 4 * 20) / 5
        
        phone1 = PhoneInput(frame: CGRect(x: 30, y: inputLabel.frame.origin.y + 45, width: width, height: 30))
        phone1.keyboardType = .numberPad
        self.view.addSubview(phone1)
        
        phone2 = PhoneInput(frame: CGRect(x: phone1.frame.origin.x + width + 20, y: phone1.frame.origin.y, width: width, height: 30))
        phone2.keyboardType = .numberPad
        self.view.addSubview(phone2)
        
        phone3 = PhoneInput(frame: CGRect(x: phone2.frame.origin.x + width + 20, y: phone1.frame.origin.y, width: width, height: 30))
        phone3.keyboardType = .numberPad
        self.view.addSubview(phone3)
        
        phone4 = PhoneInput(frame: CGRect(x: phone3.frame.origin.x + width + 20, y: phone1.frame.origin.y, width: width, height: 30))
        phone4.keyboardType = .numberPad
        self.view.addSubview(phone4)
        
        phone5 = PhoneInput(frame: CGRect(x: phone4.frame.origin.x + width + 20, y: phone1.frame.origin.y, width: width, height: 30))
        phone5.keyboardType = .numberPad
        self.view.addSubview(phone5)
        
        
        let separator1 = UIView(frame: CGRect(x: phone2.frame.origin.x - 16.5, y: phone1.frame.origin.y + 15, width: 12.5, height: 2))
        separator1.backgroundColor = UIColor(named: "lightblue")
        self.view.addSubview(separator1)
        
        let separator2 = UIView(frame: CGRect(x: phone3.frame.origin.x - 16.5, y: phone1.frame.origin.y + 15, width: 12.5, height: 2))
        separator2.backgroundColor = UIColor(named: "lightblue")
        self.view.addSubview(separator2)
        
        let separator3 = UIView(frame: CGRect(x: phone4.frame.origin.x - 16.5, y: phone1.frame.origin.y + 15, width: 12.5, height: 2))
        separator3.backgroundColor = UIColor(named: "lightblue")
        self.view.addSubview(separator3)
        
        let separator4 = UIView(frame: CGRect(x: phone5.frame.origin.x - 16.5, y: phone1.frame.origin.y + 15, width: 12.5, height: 2))
        separator4.backgroundColor = UIColor(named: "lightblue")
        self.view.addSubview(separator4)
        
        phone1.delegate = self
        phone2.delegate = self
        phone3.delegate = self
        phone4.delegate = self
        phone5.delegate = self
        
        phone1.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        phone2.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        phone3.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        phone4.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        phone5.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        
        let registerBtn = MainButton(frame: CGRect(x: 30, y: phone1.frame.origin.y + phone1.frame.height + 40, width: self.view.frame.width - 60, height: 52))
        registerBtn.setTitle("Enregistrer", for: .normal)
        self.view.addSubview(registerBtn)
        registerBtn.addTarget(self, action: #selector(registerPhone), for: .touchUpInside)
        
        let otherLabel = UILabel(frame: CGRect(x: 0, y: registerBtn.frame.origin.y + registerBtn.frame.height + 20, width: self.view.frame.width, height: 15))
        otherLabel.font = UIFont(name: "Poppins-Regular", size: 13)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Je n'ai pas de numéro de téléphone", attributes: underlineAttribute)
        otherLabel.attributedText = underlineAttributedString
        otherLabel.textAlignment = .center
        self.view.addSubview(otherLabel)
        
        let emailLabel = UILabel(frame: CGRect(x: 0, y: otherLabel.frame.origin.y + otherLabel.frame.height + 5, width: self.view.frame.width, height: 15))
        emailLabel.font = UIFont(name: "Poppins-Regular", size: 13)
        let underlineString = NSAttributedString(string: "M'enregistrer autrement", attributes: underlineAttribute)
        emailLabel.attributedText = underlineString
        emailLabel.textColor = .red
        emailLabel.textAlignment = .center
        emailLabel.isUserInteractionEnabled = true
        self.view.addSubview(emailLabel)
        
        emailLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToEmail)))
        
        let nurseImg = UIImageView(image: UIImage(named: "nurse"))
        nurseImg.frame = CGRect(x: -self.view.frame.width/4, y: self.view.frame.height - 300, width: self.view.frame.width, height: self.view.frame.width)
        self.view.addSubview(nurseImg)
        
        self.addBack()
        self.addHideKeyboard()
    }
    
    @objc func textFieldDidChanged() {
        phone = "\(phone1.text ?? "")\(phone2.text ?? "")\(phone3.text ?? "")\(phone4.text ?? "")\(phone5.text ?? "")"
        
        if phone.count == 2 {
            phone2.becomeFirstResponder()
        }
        else if phone.count == 4 {
            phone3.becomeFirstResponder()
        }
        else if phone.count == 6 {
            phone4.becomeFirstResponder()
        }
        else if phone.count == 8 {
            phone5.becomeFirstResponder()
        }
    }
    
    @objc func registerPhone(_ sender: UIView) {
        let ac = UIAlertController(title: "MERCI !", message: "Votre contact a bien été enregistré", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.phone1.becomeFirstResponder()
        }))
        present(ac, animated: true, completion: nil)
        
        for field in [phone1, phone2, phone3, phone4, phone5] {
            field.text = ""
        }
    }
    
    func addBack() {
        let backBtn = BackButton()
        self.view.addSubview(backBtn)
        backBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backTapped)))
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            backBtn.widthAnchor.constraint(equalToConstant: 25),
            backBtn.heightAnchor.constraint(equalToConstant: 25),
            backBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    @objc func backTapped() {
        let ac = UIAlertController(title: "Êtes-vous sûr de vouloir terminer cette plage horaire", message: "", preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "Mot de passe"
        }
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func goToEmail(_ sender: UIView) {
        let vc = EmailViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.serviceName = self.serviceName
        self.present(vc, animated: true, completion: nil)
    }

}
