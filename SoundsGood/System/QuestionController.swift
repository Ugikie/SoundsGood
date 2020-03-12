//
//  QuestionController.swift
//  SoundsGood
//
//  Created by Austin Adam on 2/25/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import Foundation
import SwiftUI
import SQLite


func getNextQuestion() -> String {
    return "Next Question"
}

func computeResults(_ selectedAnswer: String, trackedTags: [String]) {
        
    var queryString = "SELECT food FROM food_info WHERE \(selectedAnswer) == 1"
    
    for tag in trackedTags {
        queryString = queryString + " AND \(tag) == 1"
    }
    do {
        for result in try db.prepare(queryString) {
            print(result[0]!)
        }
    } catch {
        print("Error finding a value for tag: \(selectedAnswer)")
    }

}

func getNumberOfResults(expression: Expression<Int>) -> Int {
    
    let count = try! db.scalar(food_info.filter(expression == 1).count)
    return count
}
