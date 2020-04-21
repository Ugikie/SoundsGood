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
    return "Are you in the mood for something Sweet or Savory?"
}

func computeResults(_ selectedAnswer: String, trackedTags: [String]) -> [String] {
        
    var queryString = "SELECT food FROM food_info WHERE \"\(selectedAnswer)\" == 1"

    for tag in trackedTags {
        queryString = queryString + " AND \"\(tag)\" == 1"
    }

    var totalNumberOfResults: Int = 0
    var resultingFoods: [String] = []

    do {

        print("\n")

        for result in try db.prepare(queryString) {
            totalNumberOfResults += 1
            resultingFoods.append(result[0]! as! String)
            print(result[0]!)
        }
        
        if totalNumberOfResults <= 5 && totalNumberOfResults > 0 {

            print("\nResults are:")

            for resultingFood in resultingFoods {
                print(resultingFood)

            }
            

        } else if totalNumberOfResults == 0 {
            print("\nNo results")
        }
        
    } catch {
        print("Error finding a value for tag: \(selectedAnswer)")
    }
    return getNewAnswers(trackedTags)
}

func getNewAnswers(_ trackedTags: [String]) -> [String] {
    var newAnswers: [String] = []
    
    let shuffledAnswers = listOfFoodTags.shuffled()
    
    var count = 0
    for tag in shuffledAnswers {
        count += 1
        if (count <= 4 && !trackedTags.contains(tag)) {
            newAnswers.append(tag.capitalized)
        } else if count > 4 {
            break
        }
    }
    return newAnswers
}

func getNumberOfResults(expression: Expression<Int>) -> Int {
    
    let count = try! db.scalar(food_info.filter(expression == 1).count)
    return count
}
