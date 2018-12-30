//
//  TripModel.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import Foundation
class TripModel {
    var id: String!
    var title: String!
    
    init(title:String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
