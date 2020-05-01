//
//  QInfo.swift
//  SoundsGood
//
//  Created by Andrew Miner on 4/30/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

class QInfo: Identifiable, ObservableObject {
    static private var TAG_SELECTION: [String: TagState] = [:]
    static private var ACTIVE_TAGS: [String] = getTags()
    static private var RESULTS: [String] = []
    
    let id: UUID = UUID()
    @Published var question: String = ""
    
    var tags: [String: TagState] = [:]

    // This is basically an ordered dictionary
    // e.g. ["Answer" : "TagState/TagName"]
    var answers: [String] = []
    var ans_vals: [String] = []
    
    init(_ src_tag: String? = nil) {
        if let tag = src_tag {
            getQuestionData(tag,
                            &self.question,
                            &self.tags,
                            &self.answers,
                            &self.ans_vals)
        }
    }
    
    static func resetSelection() {
        QInfo.TAG_SELECTION = [:]
        QInfo.ACTIVE_TAGS = getTags()
        QInfo.RESULTS = []
    }
    
    static func getResults() -> [String] {
        return QInfo.RESULTS
    }
    
    static func updateResults() {
        QInfo.RESULTS = tagQuery(QInfo.TAG_SELECTION)
    }
    
    static func getSelection() -> [String: TagState] {
        return QInfo.TAG_SELECTION
    }
    
    private func updateStaticTags() {
        QInfo.TAG_SELECTION.merge(tags) {
            (_, new) in new
        }
        
        for tag in self.tags.keys {
            QInfo.ACTIVE_TAGS.removeAll { $0 == tag }
        }
    }
    
    func updateAnswer(_ answerIndex: Int) -> Bool {
        if(answerIndex < 0 || answerIndex > self.answers.count - 1) {
            return false
        }

        let tagName = ans_vals[answerIndex]
        
        let tagState = Int(tagName)
        if(tagState != nil) {
            for tag in self.tags.keys {
                self.tags[tag] = TagState(rawValue: tagState!)
            }
        }
        else if (self.tags[tagName] != nil) {
            self.tags[tagName] = .include
        }
        else { return false }
        
        updateStaticTags()
        
        return true
    }
    
    // Note: Also calls updateAnswer
    func getNextQuestion(_ answerIndex: Int) -> QInfo? {
        if(self.updateAnswer(answerIndex) == false) {
            return nil
        }
        
        let sumClause = buildSumClause(QInfo.ACTIVE_TAGS)
        let whereClause = buildWhereClause(QInfo.TAG_SELECTION)
        let query: String = "SELECT \(sumClause) FROM food_info \(whereClause)"
        
        do {
            let dbResults = try db.prepare(query)
            
            var maxTag: Int? = nil
            var maxSum: Int64 = 0
            for row in dbResults {
                for (index, sum) in row.enumerated() {
                    if(sum == nil || !hasQuestion(QInfo.ACTIVE_TAGS[index])) {
                        continue
                    }
                    let unwrappedSum = sum! as! Int64
                    if(maxTag == nil || maxSum < unwrappedSum)   {
                        maxTag = index
                        maxSum = unwrappedSum
                    }
                }
                
                if(maxTag != nil) {
                    break
                }
            }
            
            if(maxTag != nil) {
                return QInfo(QInfo.ACTIVE_TAGS[maxTag!])
            }
        } catch {
            print("Error filtering tag selection!")
        }
        
        return nil
    }
}

func hasQuestion(_ tag: String) -> Bool {
    let query = tag_questions.filter(tags.like("%\(tag)%"))
    
    do {
        if let qRow = try db.pluck(query) {
            return true
        }
    } catch {
        print("Error retreiving \(tag) question data!\n")
    }
    return false
}
// TagStates are set to .ignore by default
func getQuestionData(_ tag: String,
                     _ question: inout String,
                     _ tagStates: inout [String: TagState],
                     _ answers: inout [String],
                     _ ans_vals: inout [String]) {
    
    let query = tag_questions.filter(tags.like("%\(tag)%"))
    
    do {
        if let qRow = try db.pluck(query) {
            // Get Question
            question = qRow[qCol]
            
            // Grab all relevant tags
            let tagsStr: String = qRow[tags]
            let tArray = tagsStr.components(separatedBy: ";")
            for t in tArray {
                tagStates[t] = .ignore
            }
            
            // Get and Parse Answers
            for col in ansCols {
                if let qStr = qRow[col] {
                    let qArray = qStr.components(separatedBy: ";")
                    
                    if(qArray.count != 2) {
                        continue
                    }
                    
                    answers.append(qArray[0])
                    ans_vals.append(qArray[1])
                }
            }
        }
    } catch {
        print("Error retreiving \(tag) question data!\n")
    }
}
