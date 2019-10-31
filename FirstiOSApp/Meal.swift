//
//  Meal.swift
//  FirstiOSApp
//
//  Created by himanshu yadav on 28/10/19.
//  Copyright © 2019 himanshu yadav. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    
    init?(name: String, photo: UIImage?, rating: Int) {
        //Initialize store properties
        if name.isEmpty || rating < 0 {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
}
