//
//  HistoryCollectionViewController.swift
//  AlertCovid
//
//  Created by Anthony De Morais on 14/10/2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class HistoryCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let elements = [
        ["Service Soir", "19h30", "10/10/2020"],
        ["Service Midi", "11h30", "10/10/2020"],
        ["Service Soir", "19h30", "09/10/2020"],
        ["Service Midi", "11h30", "09/10/2020"],
        ["Service Soir", "19h30", "08/10/2020"],
        ["Service Midi", "11h30", "08/10/2020"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "lightgray")

        let title = TextLabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 50, height: 45))
        title.text = "Historique"
        title.configure(type: .title)
        self.view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            title.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            title.widthAnchor.constraint(equalToConstant: 200),
            title.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width - 40, height: 60)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 130, width: self.view.frame.width, height: self.view.frame.height - 100), collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "lightgray")
        self.view.addSubview(collectionView)
        
        self.addBackBtn()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CustomCollectionViewCell

        let data = elements[indexPath.row]
        cell?.configure(title: data[0], subtitle: data[2], right: data[1])

        return cell ?? UICollectionViewCell()
    }

}
