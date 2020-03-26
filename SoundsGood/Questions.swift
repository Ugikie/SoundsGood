//
//  Questions.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/5/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Questions: View {
    
    
    // for test and demo. later gonna use database
    @State private var answers = ["Breakfast", "Lunch", "Dinner", "Snack"]
    // THIS ALL FOR DEMO ONLY
    @State private var answers2 = ["Sweet", "Savory", "Not sure"]
    
    @State private var buttonBackColor:Color = .green
    
    @State private var QuestionState: String = "What do you wanna eat?"
    
    @State private var tagsFromAnswers: [String] = []
    
    
    var body: some View {
        
        ZStack {
            VStack {
           
               
               // Print question from an array
                Text(QuestionState).font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.red).cornerRadius(50)
                
                Spacer().frame(height: 100)
                
                // Print answers from an array
                
                ForEach(answers, id: \.self) {  answer in
                    Button(action: {
                        
                        self.QuestionState = getNextQuestion()
                        
                        //let newAnswers = computeResults(answer, trackedTags: self.tagsFromAnswers)
                        
                        //
                        self.tagsFromAnswers.append(answer)
                        if (answer == "Sweet"){
                            self.buttonBackColor = .white
                            self.answers2[0] = "Result1"
                            self.answers2[1] = ""
                            self.answers2[2] = ""
                            
                        }
                        else if (answer == "Savory"){
                            self.buttonBackColor = .white
                            self.answers2[0] = "Result2"
                            self.answers2[1] = ""
                            self.answers2[2] = ""
                            
                        }
                        
                        self.answers[0] = self.answers2[0]
                        self.answers[1] = self.answers2[1]
                        self.answers[2] = self.answers2[2]
                        self.answers[3] = ""
                        //result(QUESTIONSTATE, answer, track)
                        
                    }) {
                        ZStack {
                           
                       // make an even bakcground under the buttons
                            
                            if (answer == "Result1") {
                                                      
                            NavigationLink(
                                destination: FoodDetail(foodName: "French Toast"))
                            {
                                ZStack {
                                Text("").padding(.all,20).padding([.leading, .trailing], 100).background(Color.green).cornerRadius(30)
                                
                                Text("Click to see the result").frame(height: 50).font(.headline).foregroundColor(.white)
                                }
                                }
                            }
                            else if (answer == "Result2")
                            {
                                NavigationLink(
                                    destination: FoodDetail(foodName: "Omlete"))
                                {
                                    ZStack {
                                    Text("").padding(.all,20).padding([.leading, .trailing], 100).background(Color.green).cornerRadius(30)
                                    
                                    Text("Click to see the result").frame(height: 50).font(.headline).foregroundColor(.white)
                                    }
                                    }
                            }

                            else {
                                Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor).cornerRadius(30)
                                
                                Text(answer).frame(height: 50).font(.headline).foregroundColor(.white)
                                
                            }
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
