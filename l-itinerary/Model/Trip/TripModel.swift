//
//  TripModel.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit
struct TripModel {
    var id: UUID
    var title: String!
    var image: UIImage?
    var dayModels = [DayModel](){
        didSet{
            dayModels = dayModels.sorted(by: < )
        }
    }
    
    init(title:String, image: UIImage? = nil, dayModels:[DayModel]? = nil) {
        self.id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels{
            self.dayModels = dayModels
        }
    }
}
