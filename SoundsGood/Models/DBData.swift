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
        listOfTags.append((line[1]!) as! String)
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



//enum SQLiteError: Error {
//  case OpenDatabase(message: String)
//  case Prepare(message: String)
//  case Step(message: String)
//  case Bind(message: String)
//}
//
//
//class SQLiteDatabase {
//  private let dbPointer: OpaquePointer?
//  private init(dbPointer: OpaquePointer?) {
//    self.dbPointer = dbPointer
//  }
//
//  var tagNames: [NSString] = ["1"]
//
//  fileprivate var errorMessage: String {
//    if let errorPointer = sqlite3_errmsg(dbPointer) {
//      let errorMessage = String(cString: errorPointer)
//      return errorMessage
//    } else {
//      return "No error message provided from sqlite."
//    }
//  }
//
//  deinit {
//    sqlite3_close(dbPointer)
//  }
//
//  static func open(path: String) throws -> SQLiteDatabase {
//    var db: OpaquePointer?
//    // 1
//    if sqlite3_open(path, &db) == SQLITE_OK {
//      // 2
//      return SQLiteDatabase(dbPointer: db)
//    } else {
//      // 3
//      defer {
//        if db != nil {
//          sqlite3_close(db)
//        }
//      }
//      if let errorPointer = sqlite3_errmsg(db) {
//        let message = String(cString: errorPointer)
//        throw SQLiteError.OpenDatabase(message: message)
//      } else {
//        throw SQLiteError.OpenDatabase(message: "No error message provided from sqlite.")
//      }
//    }
//  }
//}
//
////let db = { () -> SQLiteDatabase in
////    do {
////        return try SQLiteDatabase.open(path: urlPath!)
////        print("Successfully opened connection to database.")
////    } catch SQLiteError.OpenDatabase(_) {
////        print("Unable to open database.")
////    }
////}()
//
//extension SQLiteDatabase {
//  func prepareStatement(sql: String) throws -> OpaquePointer? {
//    var statement: OpaquePointer?
//    guard sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil) == SQLITE_OK else {
//      throw SQLiteError.Prepare(message: errorMessage)
//    }
//    return statement
//  }
//}
//
//protocol SQLTable {
//  static var createStatement: String { get }
//}
//
//extension SQLiteDatabase {
//  func queryDBSize() -> Int32? {
//    let querySql = "SELECT COUNT(*) FROM food_info;"
//
//    guard let queryStatement = try? prepareStatement(sql: querySql) else {
//      return nil
//    }
//    defer {
//      sqlite3_finalize(queryStatement)
//    }
//    guard sqlite3_step(queryStatement) == SQLITE_ROW else {
//      return nil
//    }
//    let DBSize = sqlite3_column_int(queryStatement,0)
//    return DBSize
//  }
//}
//
//
////extension SQLiteDatabase {
////  func food(id: Int32) -> Food? {
////    let querySql = "SELECT * FROM food_info WHERE id = ?;"
////
////    guard let queryStatement = try? prepareStatement(sql: querySql) else {
////      return nil
////    }
////    defer {
////      sqlite3_finalize(queryStatement)
////    }
////    guard sqlite3_bind_int(queryStatement, 1, id) == SQLITE_OK else {
////      return nil
////    }
////    guard sqlite3_step(queryStatement) == SQLITE_ROW else {
////      return nil
////    }
////
////    let id = sqlite3_column_int(queryStatement,0)
////    let foodNameFromDB = sqlite3_column_text(queryStatement, 1)
////    let foodName = String(cString: foodNameFromDB!) as NSString
////    let originFromDB = sqlite3_column_text(queryStatement, 2)
////    let foodOrigin = String(cString: originFromDB!) as NSString
////    let breakfast = sqlite3_column_int(queryStatement, 3)
////    let lunch = sqlite3_column_int(queryStatement, 4)
////    let dinner = sqlite3_column_int(queryStatement, 5)
////
////    return Food(id: id, foodName: foodName, foodOrigin: foodOrigin, breakfast: breakfast, lunch: lunch, dinner: dinner)
////  }
////}
//
//
//
//extension SQLiteDatabase {
//  func getDBInfo() -> Int32? {
//    let querySql = "PRAGMA table_info(food_info);"
//
//    guard let queryStatement = try? prepareStatement(sql: querySql) else {
//      return nil
//    }
//    defer {
//      sqlite3_finalize(queryStatement)
//    }
//
//    while sqlite3_step(queryStatement) == SQLITE_ROW {
//        let columnID = sqlite3_column_int(queryStatement,0)
//        let columnName = sqlite3_column_text(queryStatement, 1)
//        let columnNameString = String(cString: columnName!) as NSString
//        let columnType = sqlite3_column_text(queryStatement, 2)
//        let columnTypeString = String(cString: columnType!) as NSString
//
//        self.tagNames.append(columnNameString)
//        print("Vals: \(columnID) \(columnNameString) \(columnTypeString)\n")
//
//    }
//    for tag in self.tagNames {
//        print(tag)
//    }
//    return 0
//  }
//}

