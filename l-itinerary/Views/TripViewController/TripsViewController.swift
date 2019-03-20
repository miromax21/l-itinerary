//
//  TripsViewController.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit
import Foundation
class TripsViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
  //  @IBOutlet var addButton: FloatingActionButton!
    @IBOutlet weak var addButton: FloatingActionButton!
    // @IBOutlet weak var addButton: FloatingActionButton!

    @IBOutlet var helpView: UIVisualEffectView!
    var tripIndexToEdit: Int?
    var seenHelpView : String = "seenTriphelp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        
        TripFunctions.readTrips(completion: { [unowned self] in
            self.TableView.reloadData()
            
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenHelpView) == false{
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.bounds
                }
            }
        })

        view.backgroundColor = Theme.backgroundColor
        addButton.createFloatingActionButton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSeque" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.TableView.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
    
    @IBAction func closehelpView(_ sender: AppButton) {
        helpView.removeFromSuperview()
        UIView.animate(withDuration: 0.5, animations: {
                self.helpView.alpha = 0
        }){ (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
            self.helpView = nil
        }
    }
}
extension TripsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerfofmed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete trip", message: "Are you sure went to delete this trip: \(String(describing: trip.title))", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                actionPerfofmed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerfofmed(true)
            }))
            self.present(alert, animated: true)
        }
        delete.backgroundColor = Theme.tintColor
        // delete.image = UIImage(named: "Delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSeque", sender: nil)
            actionPerformed(true)
        }
        edit.backgroundColor = Theme.blueColor
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        let trip = Data.tripModels[indexPath.row]
        vc.tripId = trip.id
        navigationController?.pushViewController(vc, animated: true)
    }
}
