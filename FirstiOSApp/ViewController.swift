//
//  ViewController.swift
//  FirstiOSApp
//
//  Created by himanshu yadav on 20/10/19.
//  Copyright © 2019 himanshu yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        fieldLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameTextField.text = "Default Text"
    }
    override func viewDidLoad() {
      
        super.viewDidLoad()
        nameTextField.delegate = self
    }


}

