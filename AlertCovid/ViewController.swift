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
    let locationManager = CLLocationManager()
    
    var resultSearchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: topView.frame.height)
        ])
        
        self.mapView = MKMapView(frame: CGRect(x: 0,
                                               y: topView.frame.height + topView.frame.maxY,
                                               width: self.view.frame.width,
                                               height: self.view.frame.height))
        self.mapView?.centerToLocation(self.initialLocation)
        self.mapView?.isZoomEnabled = true
        self.mapView?.isScrollEnabled = true
        self.mapView?.isRotateEnabled = true
        
        if let map = mapView {
            self.view.addSubview(map)
        }
        
        
        let locationSearchController = LocationSearchController()
        resultSearchController = UISearchController(searchResultsController: locationSearchController)
        resultSearchController?.searchResultsUpdater = locationSearchController
        
        let searchBar = resultSearchController!.searchBar
        searchBar.searchBarStyle = .minimal
        searchBar.sizeToFit()
        topView.addSubview(searchBar)
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        locationSearchController.mapView = mapView

        
        let connectionBtn = UIButton(frame: CGRect(x: 20, y: self.view.frame.height - 60, width: self.view.frame.width - 40, height: 40))
        connectionBtn.setTitle("Je suis commerçant", for: .normal)
        connectionBtn.setTitleColor(.white, for: .normal)
        connectionBtn.backgroundColor = .blue
        connectionBtn.layer.cornerRadius = 20
        
        self.view.addSubview(connectionBtn)
    }

    func initLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
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
