//
//  ServicesViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

class ServicesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "lightgray")

        let label1 = TextLabel(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 120))
        label1.numberOfLines = 0
        label1.text = "Création de \n service"
        label1.textAlignment = .center
        label1.configure(type: .title)
        self.view.addSubview(label1)
        
        let service = MainButton(frame: CGRect(x: 30, y: 150, width: self.view.frame.width - 60, height: 80))
        service.setTitle("Nouveau service", for: .normal)
        service.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToNewService)))
        self.view.addSubview(service)
        
        let history = MainButton(frame: CGRect(x: 30, y: 250, width: self.view.frame.width - 60, height: 80))
        history.setTitle("Historique", for: .normal)
        history.isWhite = true
        history.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToHistory)))
        self.view.addSubview(history)
        
        self.addBackBtn()
    }
    
    @objc func goToHistory() {
        let vc = HistoryCollectionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToNewService() {
        let vc = NewServiceViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
