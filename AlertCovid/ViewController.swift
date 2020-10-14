//
//  ViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 13/10/2020.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var initialLocation = CLLocation(latitude: 48.856614, longitude: 2.3522219)
    var mapView: MKMapView?
    var bottomView: UIView?
    var upBtn: UIButton?
    let locationManager = CLLocationManager()
    
    var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 1, alpha: 0)
        
        self.mapView = MKMapView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: self.view.frame.width,
                                               height: self.view.frame.height))
        self.mapView?.centerToLocation(self.initialLocation)
        self.mapView?.isZoomEnabled = true
        self.mapView?.isScrollEnabled = true
        self.mapView?.isRotateEnabled = true
        
        if let map = mapView {
            self.view.addSubview(map)
        }
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        topView.backgroundColor = .white

        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: topView.frame.height)
        ])
        
        let locationSearchController = LocationSearchController()
        resultSearchController = UISearchController(searchResultsController: locationSearchController)
        resultSearchController?.searchResultsUpdater = locationSearchController
        
        let searchBar = resultSearchController!.searchBar
        searchBar.searchBarStyle = .prominent
        searchBar.backgroundColor = UIColor(white: 1, alpha: 0)
//        searchBar.sizeToFit()
        searchBar.frame = CGRect(x: 0, y: 0, width: topView.frame.width, height: topView.frame.height)
        searchBar.searchTextField.font = UIFont(name: "Poppins-Regular", size: 17)
        searchBar.placeholder = "Paris 15"
        topView.addSubview(searchBar)
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        locationSearchController.mapView = mapView
        
        bottomView = UIView(frame: CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 60))
        bottomView?.backgroundColor = .white
        
        upBtn = UIButton(frame: CGRect(x: 0, y: 5, width: self.view.frame.width, height: 20))
        upBtn?.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        upBtn?.tintColor = UIColor(named: "gray")
        upBtn?.backgroundColor = .white
        upBtn?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showButtons)))
        
        self.view.addSubview(bottomView!)
        bottomView?.addSubview(upBtn!)
    }

    func initLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func showButtons(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bottomView?.frame = CGRect(x: 0,
                                            y: self.view.frame.height - 240,
                                            width: self.view.frame.width,
                                            height: 240)
            
            let label1 = TextLabel(frame: CGRect(x: 10, y: 15, width: self.view.frame.width, height: 25))
            label1.text = "Vous êtes un restaurant ?"
            label1.textAlignment = .center
            label1.configure(type: .subtitle)
            self.bottomView?.addSubview(label1)
            
            let label2 = TextLabel(frame: CGRect(x: 10, y: 45, width: self.view.frame.width, height: 25))
            label2.text = "Un magasin ?"
            label2.textAlignment = .center
            label2.configure(type: .subtitle)
            self.bottomView?.addSubview(label2)
            
            let signupBtn = MainButton(frame: CGRect(x: 30, y: 100, width: self.view.frame.width - 60, height: 44))
            signupBtn.setTitle("Inscription", for: .normal)
            signupBtn.isGrey = true
            self.bottomView?.addSubview(signupBtn)
            signupBtn.addTarget(self, action: #selector(self.goToSignUp), for: .touchUpInside)
            
            let connectionBtn = MainButton(frame: CGRect(x: 30, y: signupBtn.frame.origin.y + signupBtn.frame.height + 20, width: self.view.frame.width - 60, height: 44))
            connectionBtn.setTitle("Connexion", for: .normal)
            self.bottomView?.addSubview(connectionBtn)
            connectionBtn.addTarget(self, action: #selector(self.goToConnection), for: .touchUpInside)
            
            self.upBtn?.isHidden = true
        }
    }
    
    @objc func goToSignUp() {
        let vc = FirstSignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func goToConnection() {
        let vc = ConnectionViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
                                    center: location.coordinate,
                                    latitudinalMeters: regionRadius,
                                    longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
    func centerToLocation(coordinates: CLLocationCoordinate2D, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
                                    center: coordinates,
                                    latitudinalMeters: regionRadius,
                                    longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc: CLLocation = manager.location else { return }
        self.mapView?.centerToLocation(loc)
    }
}
