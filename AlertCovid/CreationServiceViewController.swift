//
//  CreationServiceViewController.swift
//  AlertCovid
//
//  Created by Eliott Jarmoune on 14/10/2020.
//

import UIKit

class CreationServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let label1 = TextLabel(frame: CGRect(x: 10, y: 60, width: self.view.frame.width, height: 25))
        label1.text = "Création de service"
        label1.textAlignment = .center
        label1.configure(type: .title)
        self.view.addSubview(label1)
        
        let service = MainButton(frame: CGRect(x: 30, y: 150, width: self.view.frame.width - 60, height: 80))
        service.setTitle("Nouveau service", for: .normal)
        service.isWhite = true
//        service.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToServices)))
        self.view.addSubview(service)
        
        let history = MainButton(frame: CGRect(x: 30, y: 250, width: self.view.frame.width - 60, height: 80))
        history.setTitle("Historique", for: .normal)
        history.isWhite = true
//        history.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToServices)))
        self.view.addSubview(history)
        
        self.addBackBtn()
        self.addBackgroundImage()
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
