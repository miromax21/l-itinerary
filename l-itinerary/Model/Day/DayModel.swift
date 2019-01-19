//
//  DayModel.swift
//  l-itinerary
//
//  Created by Princess Max on 13.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import Foundation
struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title:String, subtitle:String, data:[ActivityModel]? ) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data{
            self.activityModels = data
        }
    }
    
}
