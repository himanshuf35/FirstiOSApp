//
//  MealTableViewController.swift
//  FirstiOSApp
//
//  Created by Himanshu Yadav on 07/12/20.
//  Copyright © 2020 himanshu yadav. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load Sample Data
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
             fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.mealNameLabel.text = meal.name
        cell.mealImage.image = meal.photo
        cell.ratingControl.rating = meal.rating

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "Kadhai Paneer")
        let photo2 = UIImage(named: "Aloo Jira")
        let photo3 = UIImage(named: "Noodles")
        let photo4 = UIImage(named: "Naan")
        
        //Meal Object Instants
        
        guard let kadhai_paneer = Meal(name: "Kadhai Paneer", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let noodles = Meal(name: "Noodles", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let aloo_jira = Meal(name: "Aloo Jira", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal3")
        }
        
        guard let naan = Meal(name: "Naan", photo: photo4, rating: 2) else {
            fatalError("Unable to instantiate meal4")
        }
        
        meals += [kadhai_paneer, noodles, aloo_jira, naan]
        
    }

}
