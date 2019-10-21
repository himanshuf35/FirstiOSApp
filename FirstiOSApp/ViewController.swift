//
//  ViewController.swift
//  FirstiOSApp
//
//  Created by himanshu yadav on 20/10/19.
//  Copyright © 2019 himanshu yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameTextField.text = "Default Text"
    }
    override func viewDidLoad() {
      
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

