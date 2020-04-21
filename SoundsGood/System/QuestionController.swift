//
//  QuestionController.swift
//  SoundsGood
//
//  Created by Austin Adam on 2/25/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import Foundation
import SQLite

// keep track of what is was the last question
var currentQuestion: String = ""
var getNextAnswers = ["Yes", "No", "", ""]

var resultFlag = 0
var ResultList: [String] = []

// basically counts questions, but if answer is "neither" "i don't know" - it doesn't count
var count = 1

// used to calculate most common tag
var tags_list: Set = ["breakfast", "lunch", "dinner", "dessert", "snack", "vegetarian", "doughy", "chewy", "crunchy", "sweet", "sour", "savory", "hot", "cold", "roomtemp", "$", "$$", "$$$", "healthy", "vegetables", "fired", "baked", "grilled", "milkproducts", "vegan", "sick", "junkfood", "mexican", "asian", "Italian/French", "Indian", "American", "Greek/Persian", "seafood", "chicken", "beef", "pork"]
let tag_subset1: Set = ["breakfast"]
let tag_subset2: Set = ["lunch"]
let tag_subset3: Set = ["dinner"]
let tag_subset4: Set = ["dessert"]
//let tag_subset5: Set = ["snack"]
let tag_subset6: Set = ["vegetarian"]
let tag_subset7: Set = ["doughy"]
let tag_subset8: Set = ["chewy"]
let tag_subset9: Set = ["crunchy"]
let tag_subset10: Set = ["sweet"]
let tag_subset11: Set = ["sour"]
let tag_subset12: Set = ["savory"]
let tag_subset13: Set = ["hot"]
let tag_subset14: Set = ["cold"]
let tag_subset15: Set = ["roomtemp"]
let tag_subset16: Set = ["$"]
let tag_subset17: Set = ["$$"]
let tag_subset18: Set = ["$$$"]
let tag_subset19: Set = ["healthy"]
let tag_subset20: Set = ["vegetables"]
let tag_subset21: Set = ["fired"]
let tag_subset22: Set = ["baked"]
let tag_subset23: Set = ["grilled"]
let tag_subset24: Set = ["milkproducts"]
let tag_subset25: Set = ["vegan"]
let tag_subset26: Set = ["junkfood"]
let tag_subset27: Set = ["mexican"]
let tag_subset28: Set = ["asian"]
let tag_subset29: Set = ["Italian/French"]
let tag_subset30: Set = ["Indian"]
let tag_subset31: Set = ["American"]
let tag_subset32: Set = ["Greek/Persian"]
let tag_subset33: Set = ["seafood"]
let tag_subset34: Set = ["chicken"]
let tag_subset35: Set = ["beef"]
let tag_subset36: Set = ["pork"]
let tag_subset37: Set = ["sick"]

var tag1_64 = Expression<Int64>("")
var tag2_64 = Expression<Int64>("")
var tag3_64 = Expression<Int64>("")
var tag4_64 = Expression<Int64>("")
var tag5_64 = Expression<Int64>("")
var tag6_64 = Expression<Int64>("")
var tag7_64 = Expression<Int64>("")
var tag8_64 = Expression<Int64>("")
var tag9_64 = Expression<Int64>("")
var tag10_64 = Expression<Int64>("")
var tag11_64 = Expression<Int64>("")
var tag12_64 = Expression<Int64>("")

var answer_int1:Int64 = 0
var answer_int2:Int64 = 0
var answer_int3:Int64 = 0
var answer_int4:Int64 = 0
var answer_int5:Int64 = 0
var answer_int6:Int64 = 0
var answer_int7:Int64 = 0
var answer_int8:Int64 = 0
var answer_int9:Int64 = 0
var answer_int10:Int64 = 0
var answer_int11:Int64 = 0
var answer_int12:Int64 = 0

private var QuestionState2: String = "Are you Vegan or Vegetarian?"
private var AnswerState2 = ["Vegan", "Vegetarian", "Neither", ""]
private var QuestionState3: String = "Are you in the mood for something Sweet or Savory?"
private var AnswerState3 = ["Sweet", "Savory", "", ""]
private var QuestionState4: String = "Would you be interested in fast food?"
private var AnswerState4 = ["Yes", "No", "", ""]
private var QuestionState6: String = "Would you like your food item to be warm, cold, or room temperature?"
private var AnswerState6 = ["Warm", "Cold", "Room Temperature", ""]
private var QuestionState7: String = "Would you be opposed to your food being Chewy?"
private var AnswerState7 = ["Yes, I don't want chewy", "No, I don't mind if it's chewy", "", ""]
private var QuestionState8: String = "Would you be opposed to your food being Crunchy?"
private var AnswerState8 = ["Yes, I do not want it to be crunchy", "No, I do not mind if it is crunchy", "", ""]
//private var QuestionState9: String = "Do you want your food to contain meat?"
//private var AnswerState9 = ["Yes", "No", "", ""]
private var QuestionState10: String = "In terms of cooking method, would you prefer your food be baked, fried, or grilled?"
private var AnswerState10 = ["Baked", "Fried", "Grilled", "Does not matter"]
private var QuestionState11: String = "Would you like your food choice to be Sour?"
private var AnswerState11 = ["Yes", "No", "", ""]
private var QuestionState12: String = "How much would you be willing to spend for your food choice?"
private var AnswerState12 = ["Price: $", "Price: $$", "Price: $$$", ""]
private var QuestionState13: String = "Would you like your food choice to be healthy?"
private var AnswerState13 = ["Yes", "No", "", ""]
private var QuestionState14: String = "Do you want your food choice to have vegetables?"
private var AnswerState14 = ["Yes", "No", "", ""]
//private var QuestionState15: String = "Have you been/are you sick?"
//private var AnswerState15 = ["Yes", "No", "", ""]
private var QuestionState16: String = "Do you want specific type of meat?"
private var AnswerState16 = ["Beef", "Chicken", "Pork", "I don't want meat"]
private var QuestionState17: String = "Would you be interested in a Seafood dish?"
private var AnswerState17 = ["Yes", "No", "", ""]
private var QuestionState18: String = "How about something doughy?"
private var AnswerState18 = ["Yes", "No", "", ""]
private var QuestionState19: String = "Can it contain milk products"
private var AnswerState19 = ["Yes", "No", "", ""]

private var question_flag = 0

func getNextQuestion(_ tagChoice :  String) -> String {

    var no_option_flag = 0
    var temp_tag_64 = Expression<Int64>("")
    var temp_answer_int: Int64 = 0
    if (currentQuestion == "What type of meal do you think you would like?") {
        tag1_64 = Expression<Int64>(tagChoice)
        answer_int1 = 1

        tags_list = tags_list.subtracting(tag_subset1)
        tags_list = tags_list.subtracting(tag_subset2)
        tags_list = tags_list.subtracting(tag_subset3)
        tags_list = tags_list.subtracting(tag_subset4)
        //tags_list = tags_list.subtracting(tag_subset5)
    }
    else if (currentQuestion == "Are you Vegan or Vegetarian?"){
        if (tagChoice == "Vegan"){
            tag2_64 = Expression<Int64>("vegan")
            answer_int2 = 1
            tags_list = tags_list.subtracting(tag_subset35)
            tags_list = tags_list.subtracting(tag_subset36)
            tags_list = tags_list.subtracting(tag_subset37)
        }
        else if (tagChoice == "Vegetarian"){
            tag2_64 = Expression<Int64>("vegetarian")
            answer_int2 = 1
            tags_list = tags_list.subtracting(tag_subset35)
            tags_list = tags_list.subtracting(tag_subset36)
            tags_list = tags_list.subtracting(tag_subset37)
        }
        else if (tagChoice == "Neither"){
            no_option_flag = 1
        }
        tags_list = tags_list.subtracting(tag_subset6)
        tags_list = tags_list.subtracting(tag_subset25)
    }
    else if (currentQuestion == "Are you in the mood for something Sweet or Savory?") {
        if (tagChoice == "Sweet"){
            temp_tag_64 = Expression<Int64>("sweet")
            temp_answer_int = 1
        }
        else if (tagChoice == "Savory"){
            temp_tag_64 = Expression<Int64>("savory")
            temp_answer_int = 1
        }
        tags_list = tags_list.subtracting(tag_subset10)
        tags_list = tags_list.subtracting(tag_subset12)
    }
    else if (currentQuestion == "Would you be interested in fast food?") {
        if (tagChoice == "Yes"){
            temp_tag_64 = Expression<Int64>("junkfood")
            temp_answer_int = 1
        }
        else if (tagChoice == "No"){
            temp_tag_64 = Expression<Int64>("junkfood")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset26)
    }
    else if (currentQuestion == "Would you like your food item to be warm, cold, or room temperature?") {
        if (tagChoice == "Warm"){
            temp_tag_64 = Expression<Int64>("hot")
            temp_answer_int = 1
            print("HOT")
        }
        else if (tagChoice == "Cold"){
            temp_tag_64 = Expression<Int64>("cold")
            temp_answer_int = 1
        }
        else if (tagChoice == "Rom Temperature"){
            temp_tag_64 = Expression<Int64>("roomtemp")
            temp_answer_int = 1
        }
        tags_list = tags_list.subtracting(tag_subset13)
        tags_list = tags_list.subtracting(tag_subset14)
        tags_list = tags_list.subtracting(tag_subset15)
    }
    else if (currentQuestion == "Would you be opposed to your food being Chewy?") {
        if (tagChoice == "Yes, I don't want chewy"){
            temp_tag_64 = Expression<Int64>("chewy")
            temp_answer_int = 0
        }
        else if (tagChoice == "No, I don't mind if it's chewy"){
            temp_tag_64 = Expression<Int64>("chewy")
            temp_answer_int = 1
        }
        tags_list = tags_list.subtracting(tag_subset8)
    }
    else if (currentQuestion == "Would you be opposed to your food being Crunchy?") {
        if (tagChoice == "Yes, I do not want it to be crunchy"){
            temp_tag_64 = Expression<Int64>("crunchy")
            temp_answer_int = 0
        }
        else if (tagChoice == "No, I do not mind if it is crunchy"){
            temp_tag_64 = Expression<Int64>("crunchy")
            temp_answer_int = 1
        }
        tags_list = tags_list.subtracting(tag_subset9)
    }
    else if (currentQuestion == "In terms of cooking method, would you prefer your food be baked, fried, or grilled?") {
        if (tagChoice == "Grilled"){
            temp_tag_64 = Expression<Int64>("grilled")
            temp_answer_int = 1
        }
        else if (tagChoice == "Fried"){
            temp_tag_64 = Expression<Int64>("fried")
            temp_answer_int = 1
        }
        else if (tagChoice == "Does not matter"){
            count -= 1
            no_option_flag = 1
        }
        tags_list = tags_list.subtracting(tag_subset21)
        tags_list = tags_list.subtracting(tag_subset22)
        tags_list = tags_list.subtracting(tag_subset23)
    }
    else if (currentQuestion == "Would you like your food choice to be Sour?") {
           if (tagChoice == "Yes"){
               temp_tag_64 = Expression<Int64>("sour")
               temp_answer_int = 1
           }
           else if (tagChoice == "No"){
               temp_tag_64 = Expression<Int64>("sour")
               temp_answer_int = 0
           }
        tags_list = tags_list.subtracting(tag_subset11)
    }
    else if (currentQuestion == "How much would you be willing to spend for your food choice?") {
        if (tagChoice == "Price: $"){
            temp_tag_64 = Expression<Int64>("$")
            temp_answer_int = 1
            print("hey")
        }
        else if (tagChoice == "Price: $$"){
            temp_tag_64 = Expression<Int64>("$$")
            temp_answer_int = 1
        }
        else if (tagChoice == "Price: $$$"){
            temp_tag_64 = Expression<Int64>("$$$")
            temp_answer_int = 1
        }
        tags_list = tags_list.subtracting(tag_subset16)
        tags_list = tags_list.subtracting(tag_subset17)
        tags_list = tags_list.subtracting(tag_subset18)
    }
    else if (currentQuestion == "Would you like your food choice to be healthy?") {
        if (tagChoice == "Yes"){
            temp_tag_64 = Expression<Int64>("healthy")
            temp_answer_int = 1
        }
        else if (tagChoice == "No"){
            temp_tag_64 = Expression<Int64>("healthy")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset19)
    }
    else if (currentQuestion == "Do you want your food choice to have vegetables?") {
        if (tagChoice == "Yes"){
            temp_tag_64 = Expression<Int64>("vegetables")
            temp_answer_int = 1
        }
        else if (tagChoice == "No"){
            temp_tag_64 = Expression<Int64>("vegetables")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset20)
    }
    else if (currentQuestion == "Do you want specific type of meat?") {
        if (tagChoice == "Chicken"){
            temp_tag_64 = Expression<Int64>("chicken")
            temp_answer_int = 1
        }
        else if (tagChoice == "Beef"){
            temp_tag_64 = Expression<Int64>("beef")
            temp_answer_int = 1
        }
        else if (tagChoice == "Pork"){
            temp_tag_64 = Expression<Int64>("pork")
            temp_answer_int = 1
        }
        else if (tagChoice == "I don't want meat"){
            no_option_flag = 1
        }
        tags_list = tags_list.subtracting(tag_subset35)
        tags_list = tags_list.subtracting(tag_subset36)
        tags_list = tags_list.subtracting(tag_subset37)
    }
    else if (currentQuestion == "Would you be interested in a Seafood dish?") {
        if (tagChoice == "Yes") {
            temp_tag_64 = Expression<Int64>("seafood")
            temp_answer_int = 1
        }
        else if (tagChoice == "No") {
            temp_tag_64 = Expression<Int64>("seafood")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset33)
    }
   else if (currentQuestion == "How about something doughy?") {
        if (tagChoice == "Yes") {
            temp_tag_64 = Expression<Int64>("doughy")
            temp_answer_int = 1
        }
        else if (tagChoice == "No") {
            temp_tag_64 = Expression<Int64>("doughy")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset7)
    }
    else if (currentQuestion == "Can it contain milk products") {
        if (tagChoice == "Yes") {
            temp_tag_64 = Expression<Int64>("milkproducts")
            temp_answer_int = 1
        }
        else if (tagChoice == "No") {
            temp_tag_64 = Expression<Int64>("milkproducts")
            temp_answer_int = 0
        }
        tags_list = tags_list.subtracting(tag_subset24)
    }

    
    if (currentQuestion == "What type of meal do you think you would like?") {
        currentQuestion = QuestionState2
        count += 1
        getNextAnswers = AnswerState2
        return QuestionState2
    }
    else if (count == 2) {
        if (no_option_flag == 1) {
            count -= 1
        }
        else {
            tag2_64 = temp_tag_64
            answer_int2 = temp_answer_int
        }
    }
    else if (count == 3) {
        if (no_option_flag == 1) {
            count -= 1
        }
        else {
            tag3_64 = temp_tag_64
            answer_int3 = temp_answer_int
        }
    }
    else if (count == 4) {
        if (no_option_flag == 1) {
            count -= 1
        }
        else {
            tag4_64 = temp_tag_64
            answer_int4 = temp_answer_int
        }
    }
    else if (count == 5) {
        if (no_option_flag == 1) {
            count -= 1
        }
        else {
            tag5_64 = temp_tag_64
            answer_int5 = temp_answer_int
        }
    }
    else if (count == 6) {
           if (no_option_flag == 1) {
               count -= 1
           }
           else {
               tag6_64 = temp_tag_64
               answer_int6 = temp_answer_int
           }
    }
    else if (count == 7) {
           if (no_option_flag == 1) {
               count -= 1
           }
           else {
               tag7_64 = temp_tag_64
               answer_int7 = temp_answer_int
           }
    }
    else if (count == 8) {
           if (no_option_flag == 1) {
               count -= 1
           }
           else {
               tag8_64 = temp_tag_64
               answer_int8 = temp_answer_int
           }
    }
    else if (count == 9) {
           if (no_option_flag == 1) {
               count -= 1
           }
           else {
               tag9_64 = temp_tag_64
               answer_int9 = temp_answer_int
           }
    }
    else if (count == 9) {
           if (no_option_flag == 1) {
               count -= 1
           }
           else {
               tag10_64 = temp_tag_64
               answer_int10 = temp_answer_int
           }
    }
    count += 1
    
    // var tagChoice_toArray = [String]()
    // tagChoice_toArray.append(tagChoice)
    var current_max = 0
    var maximum_tags = 0
    var maximum_tags_name = ""
    
    let tags_list_array = Array(tags_list)
    var index = 0
    
    
    
    print(count)
    // calculate which tag is most common in the table
    do {
        for _ in tags_list_array {
            //print(tags_list_array[index])
            let tag_64 = Expression<Int64>(tags_list_array[index])
            //initialize
            var query = food_info.select(foodName).filter(tag1_64 == answer_int1)
            if (count == 2){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag_64 == 1)
            }
            else if (count == 3){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag_64 == 1)
            }
            else if (count == 4){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag_64 == 1)
            }
            else if (count == 5){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag_64 == 1)
            }
            else if (count == 6){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag_64 == 1)
            }
            else if (count == 7){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag_64 == 1)
            }
            else if (count == 8){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7 && tag_64 == 1)
            }
            else if (count == 9){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7 && tag8_64 == answer_int8 && tag_64 == 1)
            }
            else if (count == 10){
                query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7 && tag8_64 == answer_int8 && tag9_64 == answer_int9 && tag_64 == 1)
            }
            current_max = 0
            for _ in try db.prepare(query) {
                current_max += 1
                if (current_max > maximum_tags) {
                    maximum_tags = current_max
                    maximum_tags_name = tags_list_array[index]
                }
            }
            index += 1
        }
    } catch {
            print("Error")
        }
    
    //check
    print(maximum_tags_name)
    print("Appears: \(maximum_tags) times")
    
   //  results part
    if (maximum_tags < 8) {
        
        resultFlag = 1;
        let foodName = Expression<String?>("food")
        var query = food_info.select(foodName).filter(tag1_64 == answer_int1)
        if (count == 3){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2)
        }
        else if (count == 4){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3)
        }
        else if (count == 5){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4)
        }
        else if (count == 6){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5)
        }
        else if (count == 7){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6)
        }
        else if (count == 8){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7)
        }
        else if (count == 9){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7 && tag8_64 == answer_int8)
        }
        else if (count == 10){
            query = food_info.select(foodName).filter(tag1_64 == answer_int1 && tag2_64 == answer_int2 && tag3_64 == answer_int3 && tag4_64 == answer_int4 && tag5_64 == answer_int5 && tag6_64 == answer_int6 && tag7_64 == answer_int7 && tag8_64 == answer_int8 && tag9_64 == answer_int9)
        }
        var c = 0
        do {
            for food in try db.prepare(query) {
                if (c < 5) {
                    ResultList.append(food[foodName]!)
                }
                c += 1
            }
        } catch {
            print("Error")
        }

        getNextAnswers = ["Click here to see the results", "", "", ""]
        return ""
    }
    
        if (maximum_tags_name == "sweet" || maximum_tags_name == "savory") {
            getNextAnswers = AnswerState3
            return QuestionState3
        }
        else if (maximum_tags_name == "junkfood") {
            getNextAnswers = AnswerState4
            return QuestionState4
        }
        else if (maximum_tags_name == "hot" || maximum_tags_name == "cold" || maximum_tags_name == "roomtemp") {
            getNextAnswers = AnswerState6
            return QuestionState6
        }
        else if (maximum_tags_name == "baked" || maximum_tags_name == "fried" || maximum_tags_name == "grilled") {
            getNextAnswers = AnswerState10
            return QuestionState10
        }
        else if (maximum_tags_name == "sour") {
            getNextAnswers = AnswerState11
            return QuestionState11
        }
        else if (maximum_tags_name == "$" || maximum_tags_name == "$$" || maximum_tags_name == "$$$") {
            getNextAnswers = AnswerState12
            return QuestionState12
        }
        else if (maximum_tags_name == "chewy") {
            getNextAnswers = AnswerState7
            return QuestionState7
        }
        else if (maximum_tags_name == "crunchy") {
            getNextAnswers = AnswerState8
            return QuestionState8
        }
        else if (maximum_tags_name == "healthy") {
            getNextAnswers = AnswerState13
            return QuestionState13
        }
        else if (maximum_tags_name == "vegetables") {
            getNextAnswers = AnswerState14
            return QuestionState14
        }
        else if (maximum_tags_name == "beef" || maximum_tags_name == "chicken" || maximum_tags_name == "pork") {
            getNextAnswers = AnswerState16
            return QuestionState16
        }
        else if (maximum_tags_name == "seafood") {
            getNextAnswers = AnswerState17
            return QuestionState17
        }
        else if (maximum_tags_name == "doughy") {
            getNextAnswers = AnswerState18
            return QuestionState18
        }
        else if (maximum_tags_name == "milkproducts") {
            getNextAnswers = AnswerState19
            return QuestionState19
        }
    
    return "string"
}


//
//
//func computeResults(_ selectedAnswer: String, trackedTags: [String]) -> [String] {
//
//    var queryString = "SELECT food FROM food_info WHERE \"\(selectedAnswer)\" == 1"
//
//    for tag in trackedTags {
//        queryString = queryString + " AND \"\(tag)\" == 1"
//    }
//
//    var totalNumberOfResults: Int = 0
//    var resultingFoods: [String] = []
//
//    do {
//
//        print("\n")
//
//        for result in try db.prepare(queryString) {
//            totalNumberOfResults += 1
//            resultingFoods.append(result[0]! as! String)
//            print(result[0]!)
//        }
//
//        if totalNumberOfResults <= 5 && totalNumberOfResults > 0 {
//
//            print("\nResults are:")
//
//            for resultingFood in resultingFoods {
//                print(resultingFood)
//
//            }
//
//
//        } else if totalNumberOfResults == 0 {
//            print("\nNo results")
//        }
//
//    } catch {
//        print("Error finding a value for tag: \(selectedAnswer)")
//    }
//    return getNewAnswers(trackedTags)
//}
//
//func getNewAnswers(_ trackedTags: [String]) -> [String] {
//    var newAnswers: [String] = []
//
//    let shuffledAnswers = listOfFoodTags.shuffled()
//
//    var count = 0
//    for tag in shuffledAnswers {
//        count += 1
//        if (count <= 4 && !trackedTags.contains(tag)) {
//            newAnswers.append(tag.capitalized)
//        } else if count > 4 {
//            break
//        }
//    }
//    return newAnswers
//}
//
//func getNumberOfResults(expression: Expression<Int>) -> Int {
//
//    let count = try! db.scalar(food_info.filter(expression == 1).count)
//    return count
//}
