//
//  DBData.swift
//  SoundsGood
//
//  Created by Austin Adam on 3/8/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import Foundation
import SQLite
import SwiftUI

let urlPath = Bundle.main.path(forResource: "food_db", ofType: "db")

let db = try! Connection(urlPath!)
let food_info = Table("food_info")
let food_imgs = Table("food_imgs")
let id = Expression<Int64>("id")
let foodName = Expression<String?>("food")

var listOfFoodTags = getColumnNames()

var listOfFoodNames = getFoodNames()



func getFoodInfo() {
    do {
        for food in try db.prepare(food_info) {
        print("id: \(food[id]), foodName: \(food[foodName]!)")
        }
    } catch {
        print("Error finding a value for food")
    }
    
}

func getFoodNames() -> [String] {
    var listOfFoodNames: [String] = []
    
    do {
        for food in try db.prepare(food_info) {
            //print("foodName: \(food[foodName]!)")
            listOfFoodNames.append(food[foodName]!)
        }
    } catch {
        print("Error finding a value for foodName")
    }
    
    return listOfFoodNames
    
    
}

func getTagValuesForFood(_ foodNameToCheck: String) -> [String] {
    var posTags: [String] = []


    //SELECT food from food_info WHERE food = foodNameToCheck
    let query = food_info.filter(foodName == foodNameToCheck)
    
    do {
        for tag in try db.prepare(query) {
            
            for tagName in listOfFoodTags {
                
                if (tagName == "food" || tagName == "origin") {
                    
                    let tagToCheck = Expression<String?>(tagName)
                    print("\(tagName): \(tag[tagToCheck]!)")
                    
                } else {
                    
                    let tagToCheck = Expression<Int64>(tagName)
                    
                    if (tag[tagToCheck] != 0 && (tagName != "id" )) {
                        
                        print("\(tagName): \(tag[tagToCheck])")
                        posTags.append(tagName)
                    }
                }
            }
        }
    } catch {
        print("Error finding a tag values for: \(foodNameToCheck)")
    }
    return posTags
    
}

func getColumnNames() -> [String] {
    var listOfTags: [String] = []
    
    let tableInfo = try! db.prepare("PRAGMA table_info(food_info)")
    for line in tableInfo {
        let tagName = line[1] as! String
        if (tagName != "food" && tagName != "id" && tagName != "origin" && tagName != "isFavorite") {
            listOfTags.append(tagName)
        }
    }
    
    return listOfTags
}

extension UIImage: Value {
    public class var declaredDatatype: String {
        return Blob.declaredDatatype
    }
    public class func fromDatatypeValue(_ blobValue: Blob) -> UIImage {
        return UIImage(data: Data.fromDatatypeValue(blobValue))!
    }
    public var datatypeValue: Blob {
        return self.pngData()!.datatypeValue
    }

}

func getFoodImageFor(_ foodNameToCheck: String) -> Image? {
    var foodImage: Image?
    let image = Expression<UIImage>("image")
    
    let query = food_imgs.filter(foodName == foodNameToCheck)
    
    do {
        for tag in try db.prepare(query) {
            foodImage = Image(uiImage: tag[image])
        }
    } catch {
        print("Error finding an image for: \(foodNameToCheck)")
    }
    
    return foodImage
}
