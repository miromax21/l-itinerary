//
//  DateExtensions.swift
//  l-itinerary
//
//  Created by Princess Max on 20.03.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import Foundation
extension Date{
    func add(days : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    func mediumDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
