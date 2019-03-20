//
//  AddDayViewController.swift
//  l-itinerary
//
//  Created by Princess Max on 19.03.2019.
//  Copyright © 2019 Princess Max. All rights reserved.
//
import  UIKit
import Foundation

class AddDayViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subtittleTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    var doneSaving : ((DayModel)-> ())?
    var tripIndexToEdit: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.font = UIFont(name: Theme.mainFontName, size: 26)
        
        titleLable.layer.shadowOpacity = 1
        titleLable.layer.shadowColor = UIColor.white.cgColor
        titleLable.layer.shadowOffset = CGSize.zero
        titleLable.layer.shadowRadius = 5
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func save(_ sender: UIButton) {
     //   tittleTextField.rightViewMode = .never
        //guard tittleTextField.hasValue, let newTittle = tittleTextField.text  else { return }
        let dayModel = DayModel(title: datePicker.date, subtitle: subtittleTextField.text ?? "", data: nil)
        DayFunctions.createDays(at: tripIndexToEdit, using: dayModel)
        if let doneSaving = doneSaving{
            doneSaving(dayModel)
        }
        dismiss(animated: true)
    }
}
