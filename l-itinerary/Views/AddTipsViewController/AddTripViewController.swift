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
    @IBOutlet weak var cameraButton: UIButton!
    
    var doneSaving : (()-> ())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 10
        cameraButton.setImage(UIImage(named: "camera"), for: .normal)
        titleLable.font = UIFont(name: Theme.mainFontName, size: 26)
        
        titleLable.layer.shadowOpacity = 1
        titleLable.layer.shadowColor = UIColor.white.cgColor
        titleLable.layer.shadowOffset = CGSize.zero
        titleLable.layer.shadowRadius = 5
 
        if let index = tripIndexToEdit{
            let trip = Data.tripModels[index]
            tripTextField.text = trip.title
            imageView.image = trip.image
            titleLable.text = "Edit trip"
        }

    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func save(_ sender: UIButton) {
        tripTextField.rightViewMode = .never
        guard tripTextField.hasValue, let newTripName = tripTextField.text else { return }
        if let index = tripIndexToEdit{
            TripFunctions.updateTrip(index: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!, image : imageView.image ))
        }
        if let doneSaving = doneSaving{
            doneSaving()
        } 
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        //if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization{ (status) in
                switch status{
                case .authorized:
                    self.presentPhotoPickerController()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo library restricted", message: "Photo library restricted and cannot be accesed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    self.present(alert,animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo library denied", message: "Photo library denied", preferredStyle: .alert)
                    let gotoSettingsAction = UIAlertAction(title: "Go to Settings", style: .default){ (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(cancelAction)
                    alert.addAction(gotoSettingsAction)
                    self.present(alert,animated: true)
                }
            }
        //}
    }
}


extension AddTripViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.editedImage] as? UIImage{
            self.imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
