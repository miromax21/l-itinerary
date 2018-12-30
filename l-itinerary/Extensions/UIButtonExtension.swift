//
//  UIButtonExtension.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit

extension UIButton {

    func createFloatingActionButton() {
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset =  CGSize(width: 0, height: 10)
    }
}
