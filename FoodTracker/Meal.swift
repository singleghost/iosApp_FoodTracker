//
//  Meal.swift
//  FoodTracker
//
//  Created by 谢俊东 on 2017/4/24.
//  Copyright © 2017年 zju. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
