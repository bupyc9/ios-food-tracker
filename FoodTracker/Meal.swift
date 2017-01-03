//
//  Meal.swift
//  FoodTracker
//
//  Created by Павел Афанасьев on 03/01/2017.
//
//

import UIKit

class Meal {
    //MARK: Properties
    
    var name:String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
