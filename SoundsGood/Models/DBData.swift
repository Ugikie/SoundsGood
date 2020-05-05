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

let DB_DIR = "/Users/Max717/Documents/food_db.db"

//let urlPath = Bundle.main.path(forResource: "food_db", ofType: "db")
//let db = try! Connection(urlPath!)

var db = try! Connection(DB_DIR)
var globalID: Int = 9
let food_info = Table("food_info")
let food_imgs = Table("food_imgs")
let id = Expression<Int64>("id")
let foodName = Expression<String?>("food")
var listOfFoodTags = getColumnNames()
var listOfFoodNames = getFoodNames()
//var favoriteFoods = getFavoriteFoods()

let tag_questions = Table("tag_questions")
let tags = Expression<String>("tags")
let qCol = Expression<String>("question")
let a0Col = Expression<String?>("ans0")
let a1Col = Expression<String?>("ans1")
let a2Col = Expression<String?>("ans2")
let a3Col = Expression<String?>("ans3")
let a4Col = Expression<String?>("ans4")
let a5Col = Expression<String?>("ans5")
let ansCols = [a0Col, a1Col, a2Col, a3Col, a4Col, a5Col]

var favoriteFoods = FavoriteListViewModel()

class FavoriteListViewModel: ObservableObject {
    @Published var listData = Set<String>()
    
    init() {
        listData = getFavoriteFoods()
    }
}

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

func getFavoriteFoods() -> Set<String> {
    var favoriteFoods = Set<String>()
    let isFavorite = Expression<Int64>("isFavorite")
    do {
        for food in try db.prepare(food_info) {
            if (food[isFavorite] == 1) {
                //print("foodName: \(food[foodName]!)")
                favoriteFoods.insert(food[foodName]!)
            }
        }
    } catch {
        print("Error finding a value for foodName")
    }
    
    return favoriteFoods
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
    
    return foodImage == nil ? Image(systemName: "stop") : foodImage
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

func setFavorite(_ valueToSet : Int, _ foodNameToFavorite: String ) {
    
    //try! db.prepare("UPDATE food_info SET isFavorite = \(value) WHERE food = \"Pizza\"")
    
    let foodNameToFav = food_info.filter(foodName == foodNameToFavorite)
    
    let favorite = Expression<Int64>("isFavorite")
    
    try! db.run(foodNameToFav.update(favorite <- Int64(valueToSet)))
    
    if(valueToSet == 1) {
        favoriteFoods.listData.insert(foodNameToFavorite)
    }
    else {
        favoriteFoods.listData.remove(foodNameToFavorite)
    }
    
    print("Result: ")
    print(isDBFavorite(foodNameToFavorite))
}

func getTags() -> [String] {
    var tags = getColumnNames()
    tags.removeFirst()
    tags.removeLast()
    return tags
}

func isFavorite(_ fName: String) -> Bool {
    return favoriteFoods.listData.contains(fName)
}

func isDBFavorite(_ fName: String) -> Bool {
    let fTag = Expression<Int64>("isFavorite")
    let query = food_info.select(fTag).filter(foodName == fName)
    
    do {
        if let food = try db.pluck(query) {
            return food[fTag] == 1
        }
    }
    catch { return false }
    
    return false
}

func buildWhereClause(_ tagsStates: [String: TagState]) -> String {
    var andClause: String = ""
    for (tag, state) in tagsStates {
        if(state != .ignore) {
            if(andClause.count != 0) {
                andClause += " AND "
            }
            andClause += "\"\(tag)\" == " + String(state.rawValue)
        }
    }
    
    if(andClause.count == 0) {
        return ""
    }
    
    return "WHERE " + andClause
}

func buildSumClause(_ sumTags: [String]) -> String {
    var sum: String = ""
    for tag in sumTags {
        if(sum.count != 0) {
            sum += ", "
        }
        sum += "SUM(" + "\"" + tag + "\")"
    }
    return sum
}

func tagQuery(_ tagsStates: [String: TagState]) -> [String] {
    let queryStart: String = "SELECT food FROM food_info "
    let whereClause = buildWhereClause(tagsStates)
    let query = queryStart + whereClause + " ORDER BY food"
    
    //print(query)
    var results: [String] = []
    do {
        let dbResults = try db.prepare(query)
        for row in dbResults {
            results.append(row[0]! as! String)
        }
    } catch {
        print("Error filtering tag selection!")
    }
    //print("Result Count: \(results.count)")
    return results
}
