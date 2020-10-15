//
//  NewServiceViewController.swift
//  AlertCovid
//
//  Created by Eliott Jarmoune on 14/10/2020.
//

import UIKit

class NewServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "lightgray")

        let label1 = TextLabel(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 120))
        label1.numberOfLines = 0
        label1.text = "Sélection des \n horaires"
        label1.textAlignment = .center
        label1.configure(type: .title)
        self.view.addSubview(label1)
        
        let input1 = Input(frame: CGRect(x: 30, y: 160, width: self.view.frame.width - 60, height: 50))
        input1.placeholder = "Nom de service"
        self.view.addSubview(input1)
        
        let input2 = Input(frame: CGRect(x: 30, y: 250, width: self.view.frame.width - 60, height: 50))
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        input2.text = "\(hour)h\(minutes)"
        input2.isEnabled = false
        self.view.addSubview(input2)
        
        let service = MainButton(frame: CGRect(x: 30, y: 340, width: self.view.frame.width - 60, height: 40))
        service.setTitle("Enregister", for: .normal)
        self.view.addSubview(service)
        
        self.addBackBtn()
    }

}
