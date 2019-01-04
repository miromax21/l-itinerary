//
//  TripModel.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit
class TripModel {
    var id: UUID
    var title: String!
    var image: UIImage?
    
    init(title:String, image: UIImage? = nil) {
        self.id = UUID()
        self.title = title
        self.image = image
    }
}
