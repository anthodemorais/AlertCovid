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
        
        let topView = UIView(frame: CGRect(x: 5, y: 0, width: self.view.frame.width, height: 36))
        topView.backgroundColor = .white
        topView.layer.cornerRadius = 10
        
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -2),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 13),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -13),
            topView.heightAnchor.constraint(equalToConstant: topView.frame.height)
        ])
        
        let locationSearchController = LocationSearchController()
        resultSearchController = UISearchController(searchResultsController: locationSearchController)
        resultSearchController?.searchResultsUpdater = locationSearchController
        
        let searchBar = resultSearchController!.searchBar
        searchBar.searchBarStyle = .minimal
        searchBar.sizeToFit()
        searchBar.frame = CGRect(x: 5, y: topView.frame.origin.y + topView.frame.height, width: self.view.frame.width - 10, height: searchBar.frame.height)
        self.view.addSubview(searchBar)
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        locationSearchController.mapView = mapView
        
        bottomView = UIView(frame: CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 60))
        bottomView?.backgroundColor = .white
        
        let upBtn = UIButton(frame: CGRect(x: 0, y: 5, width: self.view.frame.width, height: 20))
        upBtn.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        upBtn.tintColor = .gray
        upBtn.backgroundColor = .white
        upBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showButtons)))
        
        self.view.addSubview(bottomView!)
        bottomView?.addSubview(upBtn)
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
                                            y: self.view.frame.height - 220,
                                            width: self.view.frame.width,
                                            height: 220)
            
            let label1 = UILabel(frame: CGRect(x: 10, y: 30, width: self.view.frame.width, height: 25))
            label1.text = "Vous êtes un restaurant ?"
            label1.textAlignment = .center
            self.bottomView?.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 10, y: 55, width: self.view.frame.width, height: 25))
            label2.text = "Un commerce ?"
            label2.textAlignment = .center
            self.bottomView?.addSubview(label2)
            
            let connectionBtn = UIButton(frame: CGRect(x: 20, y: 95, width: self.view.frame.width - 40, height: 40))
            connectionBtn.setTitle("Se connecter", for: .normal)
            connectionBtn.setTitleColor(.white, for: .normal)
            connectionBtn.backgroundColor = .gray
            self.bottomView?.addSubview(connectionBtn)
            
            let signupBtn = UIButton(frame: CGRect(x: 20, y: connectionBtn.frame.origin.y + connectionBtn.frame.height + 10, width: self.view.frame.width - 40, height: 40))
            signupBtn.setTitle("S'inscrire", for: .normal)
            signupBtn.setTitleColor(.white, for: .normal)
            signupBtn.backgroundColor = .red
            self.bottomView?.addSubview(signupBtn)
        }
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

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

extension ViewController: UISearchBarDelegate {
    
}
