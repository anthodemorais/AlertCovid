//
//  ServiceHistoryViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 15/10/2020.
//

import UIKit

class ServiceHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [String]()
    var people = [
        ["06 06 06 06 06"],
        ["06 37 39 41 31"],
        ["Michel Durant", "michdurant@gmail.com"],
        ["07 53 95 82 12"],
        ["Joel Lemarchand", "jojodumarche@gmail.com"],
        ["06 37 39 41 31"],
        ["07 49 38 13 19"],
        ["06 74 71 39 94"],
        ["Daniel Simmoney", "danou@gmail.com"],
        ["06 34 66 21 21"],
        ["07 92 45 65 34"],
        ["06 37 39 41 31"],
        ["07 53 95 82 12"],
        ["06 37 39 41 31"],
        ["06 74 71 39 94"],
        ["07 49 38 13 19"],
        ["06 37 39 41 31"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "lightgray")
        self.addBackBtn()
        self.addBackgroundImage()
        
        let title = TextLabel(frame: CGRect(x: 0, y: 55, width: self.view.frame.width, height: 30))
        title.text = data[0]
        title.configure(type: .title)
        self.view.addSubview(title)
        
        let hour = TextLabel(frame: CGRect(x: 0, y: title.frame.origin.y + title.frame.height + 10, width: self.view.frame.width, height: 30))
        hour.text = data[1]
        hour.configure(type: .title)
        hour.font = UIFont(name: "Poppins-Bold", size: 23)
        self.view.addSubview(hour)
        
        let date = TextLabel(frame: CGRect(x: 0, y: hour.frame.origin.y + hour.frame.height + 10, width: self.view.frame.width, height: 30))
        date.text = data[2]
        date.configure(type: .normal)
        date.textAlignment = .center
        date.font = UIFont(name: "Poppins-Regular", size: 23)
        self.view.addSubview(date)
        
        let y = date.frame.origin.y + date.frame.height + 150
        let tableView = UITableView(frame: CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height - y))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = UIColor(named: "lightgray")
        self.view.addSubview(tableView)
        
        let countPersons = TextLabel(frame: CGRect(x: 0, y: y - 95, width: self.view.frame.width, height: 40))
        countPersons.text = "Nombre de personnes : \(people.count)"
        countPersons.configure(type: .subtitle)
        countPersons.textAlignment = .center
        self.view.addSubview(countPersons)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let userData = self.people[indexPath.row]
        
        if userData.count == 1 {
            cell.textLabel?.text = userData[0]
        }
        else {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "\(userData[0])\n\(userData[1])"
        }
        
        return cell
    }

}
