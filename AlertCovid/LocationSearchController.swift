//
//  LocationSearchController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 13/10/2020.
//

import UIKit
import MapKit

class LocationSearchController: UITableViewController, UISearchResultsUpdating {
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
    
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else { return }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = selectedItem.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        mapView?.centerToLocation(coordinates: selectedItem.coordinate)
        dismiss(animated: true, completion: nil)
    }

}
