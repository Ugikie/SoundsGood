//
//  Questions.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/5/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Questions: View {
    
    @State private var QuestionState: String = "What type of meal do you think you would like?"
    @State private var AnswerState = ["breakfast", "lunch", "dinner", "dessert"]
    
    
    @State private var buttonBackColor: Color = .green
    
    @State private var ResultAnswer: String = ""
    private var questionstr: String = ""
    
    
    var body: some View {
        
        ZStack {
            VStack {
               
               // Print question from an array
            Text(QuestionState).font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.red).cornerRadius(50)
                
                Spacer().frame(height: 100)
                
                // Print answers from an array
                
                ForEach(AnswerState, id: \.self) {  answer in
                    Button(action: {
                        currentQuestion = self.QuestionState
                        self.QuestionState = getNextQuestion(answer)
                        self.AnswerState = getNextAnswers
//                        
//                        //let newAnswers = computeResults(answer, trackedTags: self.tagsFromAnswers)
//                        
//                        //
//                        self.tagsFromAnswers.append(answer)
//                        if (answer == "Sweet") {
//                            self.buttonBackColor = .white
//                            self.answers2[0] = "Result"
//                            self.answers2[1] = ""
//                            self.answers2[2] = ""
//                            self.ResultAnswer = "French Toast"
//                        }
//                        else if (answer == "Savory") {
//                            self.buttonBackColor = .white
//                            self.answers2[0] = "Result"
//                            self.answers2[1] = ""
//                            self.answers2[2] = ""
//                            self.ResultAnswer = "Omlete"
//                        }
//                        else if (answer == "Not sure") {
//                            self.buttonBackColor = .white
//                            self.answers2[0] = "Result"
//                            self.answers2[1] = ""
//                            self.answers2[2] = ""
//                            self.ResultAnswer = "Pizza"
//                        }
//                        
//                        self.answers[0] = self.answers2[0]
//                        self.answers[1] = self.answers2[1]
//                        self.answers[2] = self.answers2[2]
//                        self.answers[3] = ""
//                        //result(QUESTIONSTATE, answer, track)
//                        
                    }) {
                           
                       // make an even bakcground under the buttons
                        ZStack {
                                Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor).cornerRadius(30)
                                
                            Text(answer).frame(height: 20).font(.headline).foregroundColor(.white)
                        }
                    }
                }
                
                Spacer().frame(height: 100)
                HStack {
                    
                    // this is a button to choose tags
                    
                    NavigationLink(destination: Tags())
                        {

                        Text("CHOOSE TAGS").font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(50).frame(alignment: .leading)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
