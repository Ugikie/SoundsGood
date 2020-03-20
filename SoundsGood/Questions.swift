//
//  Questions.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/5/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Questions: View {
    
    // fixing BACK button
     @Binding var isActive: Bool
    
    // for test and demo. later gonna use database
    @State private var answers = ["breakfast", "Lunch", "Dinner", "Snack"]
    
    @State private var QUESTIONSTATE: String = "What do you wanna eat?"
    
    @State private var tagsFromAnswers: [String] = []
    
    
    var body: some View {
        
        ZStack {
            VStack {
           
               
               // Print question from an array
                Text(QUESTIONSTATE).font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.red).cornerRadius(50)
                
                Spacer().frame(height: 100)
                
                // Print answers from an array
                
                ForEach(answers, id: \.self) {  answer in
                    Button(action: {
                        
                        self.QUESTIONSTATE = getNextQuestion()
                        
                        let newAnswers = computeResults(answer, trackedTags: self.tagsFromAnswers)
                        self.tagsFromAnswers.append(answer)
                        if (answer == "Answer1"){
                            
                        }
                        
                        self.answers[0] = newAnswers[0]
                        self.answers[1] = newAnswers[1]
                        self.answers[2] = newAnswers[2]
                        self.answers[3] = newAnswers[3]
                        //result(QUESTIONSTATE, answer, track)
                        
                    }) {
                        ZStack {
                           
                       // make an even bakcground under the buttons
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(Color.green).cornerRadius(30)
                            
                            Text(answer).frame(height: 50).font(.headline).foregroundColor(.white)
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
            
        }.navigationBarItems(leading: Button(action: { self.isActive = false }, label: { Text("Back") }))
        
        
    }
    
}
