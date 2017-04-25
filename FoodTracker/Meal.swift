//
//  Meal.swift
//  FoodTracker
//
//  Created by 谢俊东 on 2017/4/24.
//  Copyright © 2017年 zju. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    var price: Double   //单位是软妹币
    var makeTime: Int   //制作时间，单位是分钟
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let price = "price"
        static let makeTime = "makeTime"
    }
    init?(name: String, photo: UIImage?, rating: Int, price: Double, makeTime: Int) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        guard price >= 0 else {
            return nil
        }
        guard makeTime >= 0 else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
        self.price = price
        self.makeTime = makeTime
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(price, forKey: PropertyKey.price)
        aCoder.encode(makeTime, forKey: PropertyKey.makeTime)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        let price = aDecoder.decodeDouble(forKey: PropertyKey.price)
        let makeTime = aDecoder.decodeInteger(forKey: PropertyKey.makeTime)
        self.init(name: name, photo: photo, rating: rating, price: price, makeTime: makeTime)
    }
}

