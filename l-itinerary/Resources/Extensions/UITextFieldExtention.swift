//
//  UITextFieldExtention.swift
//  l-itinerary
//
//  Created by Princess Max on 19.03.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//

import UIKit
extension UITextField{
    var hasValue:Bool{
        guard text == "" else {return true}
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.image = #imageLiteral(resourceName: "alert")
        imageView.contentMode = .scaleAspectFit

        rightView = imageView

        rightViewMode = .unlessEditing
        return false
    }
}
