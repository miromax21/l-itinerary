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
    fileprivate func updateTableViewWithTripData() {
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return }
            self.tripModel = model
            guard let model = model else { return }
            self.title = model.title
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        updateTableViewWithTripData()
        
        self.sectionHeaderhight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
        
    }
    
    @IBAction func back(_ sender:UIButton){
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true )
    }
    @IBAction func AddAction(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let dayAction = UIAlertAction(title: "day", style: .default, handler: hendleAddDay)
        let activityAction = UIAlertAction(title: "activity", style: .default) { (action) in
            print("activity")
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: 0)
        present(alert, animated: true)
    }
    
    fileprivate func hendleAddDay(action: UIAlertAction){
        let vc = AddDayViewController.getInstance() as! AddDayViewController
        let tripIndexToEdit = Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id == tripId
        })
        vc.tripIndexToEdit = tripIndexToEdit
        vc.doneSaving = { [weak self] dayModel in
            guard let self = self else { return }
           // let indexArray = [self.tripModel?.dayModels.count ?? 0]
            self.tripModel?.dayModels.append(dayModel)
            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0]
            self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
            self.tableView.reloadData()
        }
        self.present(vc, animated: true)
    }
}
extension ActivitiesViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sectionHeaderhight
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  tripModel?.dayModels.count ?? 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let daymodel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
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
        var model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityTableViewCell
        cell.setup(model: model!)
        return cell
    
    }
}
