//
//  MealViewController.swift
//  FirstiOSApp
//
//  Created by himanshu yadav on 20/10/19.
//  Copyright © 2019 himanshu yadav. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //MARK: Properties
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
 
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker if user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage else {
                     fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set imageView to display the selected image.
        imageView.image = selectedImage
        NSLog("ImageSelected \(selectedImage)")
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameTextField.text = "Default Text"
    }
    override func viewDidLoad() {
      
        super.viewDidLoad()
        nameTextField.delegate = self
    }

    @IBAction func selectImageFromGallery(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        //UIImagePickerController is a view controller that let's user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        //Only allow photo to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure ViewController is notified when user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
}

