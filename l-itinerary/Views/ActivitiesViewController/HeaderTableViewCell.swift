//
//  HeaderTableViewCell.swift
//  l-itinerary
//
//  Created by Princess Max on 19.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(model: DayModel) {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        titleLable.text = formater.string(from: model.title)
        subTitleLable.text? = model.subtitle
    }

}
