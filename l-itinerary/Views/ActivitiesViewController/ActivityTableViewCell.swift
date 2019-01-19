//
//  ActivityTableViewCell.swift
//  l-itinerary
//
//  Created by Princess Max on 19.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var subtitleLable: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRounderCorners()
        // Initialization code
    }

    func setup(model: ActivityModel){
        activityImageView.image = getactiviImaageView(type: model.activityType)
        titleLable.text = model.title
        subtitleLable.text = model.subtitle
    }
    func getactiviImaageView(type: ActivityType) -> UIImage{
        switch type {
        case .auto:
            return #imageLiteral(resourceName: "auto")
        case .excursion:
            return #imageLiteral(resourceName: "excursion")
        case .flight:
            return #imageLiteral(resourceName: "flight")
        case .food:
            return #imageLiteral(resourceName: "food")
        case .hotel:
            return #imageLiteral(resourceName: "hotel")
        }
    }
}
