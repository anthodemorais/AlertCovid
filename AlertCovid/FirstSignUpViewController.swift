//
//  FirstSignUpViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class FirstSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        let signupBtn = MainButton(frame: CGRect(x: 30, y: (self.view.frame.height / 2) - 22, width: self.view.frame.width - 60, height: 44))
        signupBtn.setTitle("Continuer", for: .normal)
        signupBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToSecond)))
        self.view.addSubview(signupBtn)
        
        self.addBackBtn()
        self.addBackgroundImage()
    }
    
    @objc func goToSecond() {
        let vc = SecondSignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
