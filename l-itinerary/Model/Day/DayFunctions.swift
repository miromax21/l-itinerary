//
//  DayFunctions.swift
//  l-itinerary
//
//  Created by Princess Max on 19.03.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import Foundation
class DayFunctions {
    static func createDays(at tripIndex:Int,using dayModel:DayModel){
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
}
