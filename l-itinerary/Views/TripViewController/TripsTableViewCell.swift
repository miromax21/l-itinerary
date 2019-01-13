//
//  TripsTableViewCell.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRounderCorners()
        titleLable.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    func setup(tripModel:TripModel){
        titleLable.text = tripModel.title
        if let tripImage = tripModel.image{
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            UIView.animate(withDuration: 1) {
                self.tripImageView.alpha = 1
            }
        }
        tripImageView.image = tripModel.image 
    }
}
