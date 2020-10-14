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
        
        self.addBackBtn()
        self.addBackgroundImage()
    }
    
    @objc func goToServices() {
        let vc = ServicesViewController()
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
