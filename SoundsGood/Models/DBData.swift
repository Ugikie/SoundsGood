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
let id = Expression<Int64>("id")
let foodName = Expression<String?>("food")

var columnNamesFromDB = getColumnNames()
let listOfFoodTags = columnNamesFromDB.filter {$0 != " "}

func getFoodInfo() {
    for food in try! db.prepare(food_info) {
        print("id: \(food[id]), foodName: \(food[foodName]!)")
    }
    
    getTagValues()
    
}

func getTagValues() {
    for tag in listOfFoodTags {
        var query = try! food_info.select(tag)
        for value in try! db.prepare(query) {
            print("\(value), ")
        }
        
    }
}

func getColumnNames() -> [String] {
    var listOfTags: [String] = [" "]
    
    let tableInfo = try! db.prepare("PRAGMA table_info(food_info)")
    for line in tableInfo {
        listOfTags.append((line[1]!) as! String)
    }
    
    return listOfTags
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

