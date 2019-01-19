//
//  ActivitiesViewController.swift
//  l-itinerary
//
//  Created by Princess Max on 13.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
 
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var tripId : UUID!
    var tripModel: TripModel?
    var sectionHeaderhight : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return }
            self.tripModel = model
            guard let model = model else { return }
            self.title = model.title
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
        
        self.sectionHeaderhight = tableView.dequeueReusableCell(withIdentifier: "headerCell")?.contentView.bounds.height ?? 0    }
    
    @IBAction func back(_ sender:UIButton){
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true )
    }
}
extension ActivitiesViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderhight
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  tripModel?.dayModels.count ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let daymodel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        cell.setup(model: daymodel!)
        return cell.contentView
    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        let title = tripModel?.dayModels[section].title ?? ""
//        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
//        return "\(title) - \(subtitle)"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        return cell!
    
    }
}
