//
//  TripsViewController.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        
        TripFunctions.readTrips(completion: { [weak self] in
            self?.TableView.reloadData()
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
           cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "cell")
        }
        cell!.textLabel?.text = Data.tripModels[indexPath.row].title
        return cell!
    }
}
