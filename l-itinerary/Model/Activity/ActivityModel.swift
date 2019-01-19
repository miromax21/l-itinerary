//
//  ActivityModel.swift
//  l-itinerary
//
//  Created by Princess Max on 13.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import Foundation
import UIKit
struct ActivityModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title:String,subtitle:String,activityType:ActivityType, photo:UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.activityType = activityType
        self.photo = photo
    }
}
