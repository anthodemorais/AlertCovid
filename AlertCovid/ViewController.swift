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
    var downBtn: UIButton?
    var bottomViewTitle: TextLabel?
    var bottomViewTitle2: TextLabel?
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
        
        self.createBottomView()
        
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
    
    func createBottomView() {
        UIView.animate(withDuration: 0.3) {
            self.bottomView?.frame = CGRect(x: 0,
                                            y: self.view.frame.height - 240,
                                            width: self.view.frame.width,
                                            height: 240)
            
            self.downBtn = UIButton(frame: CGRect(x: 0, y: 5, width: self.view.frame.width, height: 20))
            self.downBtn?.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            self.downBtn?.tintColor = UIColor(named: "gray")
            self.downBtn?.backgroundColor = .white
            self.downBtn?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideButtons)))
            self.bottomView?.addSubview(self.downBtn!)
            
            self.bottomViewTitle = TextLabel(frame: CGRect(x: 10, y: 25, width: self.view.frame.width, height: 25))
            self.bottomViewTitle?.text = "Vous êtes un restaurant ?"
            self.bottomViewTitle?.textAlignment = .center
            self.bottomViewTitle?.configure(type: .subtitle)
            self.bottomView?.addSubview(self.bottomViewTitle!)
            
            self.bottomViewTitle2 = TextLabel(frame: CGRect(x: 10, y: 55, width: self.view.frame.width, height: 25))
            self.bottomViewTitle2?.text = "Un magasin ?"
            self.bottomViewTitle2?.textAlignment = .center
            self.bottomViewTitle2?.configure(type: .subtitle)
            self.bottomView?.addSubview(self.bottomViewTitle2!)
            
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
    
    @objc func hideButtons() {
        UIView.animate(withDuration: 0.3) {
            self.bottomView?.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: self.bottomView!.frame.height)
            self.downBtn?.isHidden = true
            self.upBtn?.isHidden = false
            
            self.bottomViewTitle?.isHidden = true
            self.bottomViewTitle2?.isHidden = true
        }
    }
    
    @objc func showButtons() {
        UIView.animate(withDuration: 0.3) {
            self.bottomView?.frame = CGRect(x: 0, y: self.view.frame.height - 240, width: self.view.frame.width, height: self.bottomView!.frame.height)
            self.downBtn?.isHidden = false
            self.upBtn?.isHidden = true
            
            self.bottomViewTitle?.isHidden = false
            self.bottomViewTitle2?.isHidden = false
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
