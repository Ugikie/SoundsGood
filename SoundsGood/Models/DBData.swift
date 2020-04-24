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

//let urlPath = Bundle.main.path(forResource: "food_db", ofType: "db")
//let db = try! Connection(urlPath!)

var db = try! Connection("/Users/Max717/Documents/food_db.db")
var globalID: Int = 9
let food_info = Table("food_info")
let food_imgs = Table("food_imgs")
let id = Expression<Int64>("id")
let foodName = Expression<String?>("food")
var listOfFoodTags = getColumnNames()
var listOfFoodNames = getFoodNames()
var favoriteFoods = getFavoriteFoods()


func getID(_ foodNameToCheck: String) {
    
    //var ID: Int64 = 0
    let idtag = Expression<Int64>("id")
    //SELECT isFavorite from food_info WHERE food = foodNameToCheck
    let query = food_info.select(idtag)
                         .filter(foodName == foodNameToCheck)
    
    
    do {
        for value in try db.prepare(query) {
            
            globalID = Int(value[idtag])
        }
    } catch {
            print("Error finding food \(foodNameToCheck)!\n")
        }
}

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

func getFavoriteFoods() -> [String] {
    
    
    db = try! Connection("/Users/Max717/Documents/food_db.db")
    print("UPDATED NOW")
    
    var favoriteFoods: [String] = []
    var sortedFood: [String] = []
    let isFavorite = Expression<Int64>("isFavorite")
    do {
        for food in try db.prepare(food_info) {
            if (food[isFavorite] == 1) {
                //print("foodName: \(food[foodName]!)")
                favoriteFoods.append(food[foodName]!)
            }
        }
    } catch {
        print("Error finding a value for foodName")
    }
    // list of food is now sorted
    sortedFood = favoriteFoods.sorted()
    return sortedFood
}

func getTagValuesForFood(_ foodNameToCheck: String) -> [String] {
    
    // just in case update globalID here as well
    getID(foodNameToCheck)
    
    print(globalID)
    print("WTF")
    
    var posTags: [String] = []


    //SELECT food from food_info WHERE food = foodNameToCheck
    let query = food_info.filter(foodName == foodNameToCheck)
    
    do {
        for tag in try db.prepare(query) {
            
            for tagName in listOfFoodTags {
                
                if (tagName == "food" || tagName == "origin") {
                    
                    //let tagToCheck = Expression<String?>(tagName)
                    //print("\(tagName): \(tag[tagToCheck]!)")
                    
                } else {
                    
                    let tagToCheck = Expression<Int64>(tagName)
                    
                    if (tag[tagToCheck] != 0 && (tagName != "id" )) {
                        
                        //print("\(tagName): \(tag[tagToCheck])")
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
        if (tagName != "food" && tagName != "id" && tagName != "origin") {
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
    
    //Each time image is loaded - globalID is updated
    getID(foodNameToCheck)
    
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

func setIsFavorite(_ valueToSet : Int, _ foodNameToFavorite: String ) {
    
    //try! db.prepare("UPDATE food_info SET isFavorite = \(value) WHERE food = \"Pizza\"")
    let foodNameToFav = food_info.filter(foodName == foodNameToFavorite)
    
    let favorite = Expression<Int64>("isFavorite")
    
    try! db.run(foodNameToFav.update(favorite <- Int64(valueToSet)))
    
    print("Result: ")
    print(checkIsFavorite(foodNameToFavorite))
}

func checkIsFavorite(_ foodNameToCheck: String) -> Color {
    
    var isFavorite: Int64 = 0
    var color: Color = .gray
     
    let favorite = Expression<Int64>("isFavorite")
    //SELECT isFavorite from food_info WHERE food = foodNameToCheck
    let query = food_info.select(favorite)
                         .filter(foodName == foodNameToCheck)
    
    
    do {
        for value in try db.prepare(query) {
            
            isFavorite = value[favorite]
            //print("Result: ")
            //print("\(value[favorite])")
        }
    } catch {
            print("Error finding food \(foodNameToCheck)!\n")
        }
    if (isFavorite == 1) {

        color = .red
    }
    else if (isFavorite == 0) {

        color = .gray
    }
    return color
}

func getTags() -> [String] {
    
    let tags_list: [String] = ["Breakfast", "Lunch", "Dinner", "Dessert", "Snack", "Vegetarian", "Doughy", "Chewy", "Crunchy", "Sweet", "Sour", "Savory", "Hot", "Cold", "Room Temp", "Price: $", "Price: $$", "Price: $$$", "Healthy", "Vegetables", "Fired", "Baked", "Grilled", "Milk", "Vegan", "Sick", "Fast Food", "Mexican", "Asian", "Italian,   French", "Indian", "American", "Greek, Persian", "Seafood", "Chicken", "Beef", "Pork"]
    let tags = tags_list
    //tags.removeFirst()
    //tags.removeLast()
    return tags
}
