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
        
        self.view.backgroundColor = .white

        let connectionBtn = MainButton(frame: CGRect(x: 30, y: (self.view.frame.height / 2) - 22, width: self.view.frame.width - 60, height: 44))
        connectionBtn.setTitle("Continuer", for: .normal)
        connectionBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToServices)))
        self.view.addSubview(connectionBtn)
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
