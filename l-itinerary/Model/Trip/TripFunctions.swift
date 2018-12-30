//
//  TripFunctions.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import Foundation
class TripFunctions {
    static func createTrip(tripModel:TripModel){
        
    }
    static func readTrips(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0{
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    static func updateTrip(tripModel:TripModel){
        
    }
    
    static func deleteTrip(tripModel:TripModel){
        
    }
}
