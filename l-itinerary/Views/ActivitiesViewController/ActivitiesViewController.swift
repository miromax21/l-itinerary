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
    var tripId : UUID!
    var tripModel: TripModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return }
            self.tripModel = model
            guard let model = model else { return }
            self.title = model.title
            self.backgroundImageView.image = model.image
        }
    }
    
    @IBAction func back(_ sender:UIButton){
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true )
    }
}

