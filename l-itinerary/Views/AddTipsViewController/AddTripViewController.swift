//
//  AddTripViewController.swift
//  l-itinerary
//
//  Created by Princess Max on 30.12.2018.
//  Copyright © 2018 Princess Max. All rights reserved.
//

import UIKit
import Photos
class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving : (()-> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.font = UIFont(name: Theme.mainFontName, size: 26)
        imageView.layer.cornerRadius = 10

    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func save(_ sender: UIButton) {
        tripTextField.rightViewMode = .never
        guard tripTextField.text != "", let _ = tripTextField.text else {
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//            imageView.image = #imageLiteral(resourceName: "alert")
//            imageView.contentMode = .scaleAspectFit
//
//            tripTextField.rightView = imageView
//
//            tripTextField.rightViewMode = .always
//            return
            tripTextField.layer.borderColor = Theme.tintColor?.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            
            tripTextField.placeholder = "Trio name required "
          //  tripTextField.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            return
        }
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!))
        if let doneSaving = doneSaving{
            doneSaving()
        } 
        dismiss(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization{ (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.delegate = self
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
//                case .notDetermined:
//                    <#code#>
//                case .restricted:
//                    <#code#>
//                case .denied:
//                    <#code#>
                }
            }
        }
    }
}


extension AddTripViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//       
//    }
}
