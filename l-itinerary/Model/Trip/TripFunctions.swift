//
//  TripFunctions.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import Foundation
import UIKit
class TripFunctions {
    static func createTrip(tripModel:TripModel){
        Data.tripModels.append(tripModel)
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
    
    static func readTrip(by id:UUID, completion: @escaping (TripModel?) -> ()){
        
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: {$0.id == id})
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    static func updateTrip(index:Int,title:String, image: UIImage? = nil){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index:Int){
        Data.tripModels.remove(at: index)
    }
}
