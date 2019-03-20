//
//  MockData.swift
//  l-itinerary
//
//  Created by Princess Max on 19.01.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import Foundation
class MockData{
    static func createMockTripModelData() -> [TripModel]{
        var mockTrips = [TripModel]()
        
        mockTrips.append(TripModel(title: "Trip 1", image: #imageLiteral(resourceName: "Aerial04"), dayModels: createmockDayModeldata()))
        mockTrips.append(TripModel(title: "Trip 2", image: #imageLiteral(resourceName: "backgroundScreen"), dayModels: createmockDayModeldata()))
        mockTrips.append(TripModel(title: "Trip 3", image: #imageLiteral(resourceName: "Aerial03"), dayModels: createmockDayModeldata()))
        
        return mockTrips
    }
    static func createmockDayModeldata() -> [DayModel]{
        var dayModel = [DayModel]()
        dayModel.append(DayModel(title: Date().add(days: 1), subtitle: "createmockDayModeldata  subtittle 1", data: createMockActivityModelData()))
        dayModel.append(DayModel(title: Date().add(days: 2), subtitle: "createmockDayModeldata  subtittle 2", data: createMockActivityModelData()))
        dayModel.append(DayModel(title: Date().add(days: 3), subtitle: "createmockDayModeldata  subtittle 3", data: createMockActivityModelData()))
        return dayModel
    }
    
    static func createMockActivityModelData() -> [ActivityModel]{
        var activityModel = [ActivityModel]()
        activityModel.append(ActivityModel(title: "createMockActivityModelData 1", subtitle: "createMockActivityModelData  subtittle 1", activityType: .flight))
        activityModel.append(ActivityModel(title: "createMockActivityModelData 2", subtitle: "createMockActivityModelData  subtittle 2", activityType: .food))
        activityModel.append(ActivityModel(title: "createMockActivityModelData 3", subtitle: "createMockActivityModelData  subtittle 3", activityType: .hotel))
        return activityModel
    }
}
