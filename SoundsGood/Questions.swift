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
    @State var QuestionButtonBackColor: Color = .red
    @State private var ResultAnswer: String = ""
    private var questionstr: String = ""
    
    
    var body: some View {
        
        ZStack {
            VStack {
               
               // Print question from an array
                Text(QuestionState).font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(self.QuestionButtonBackColor).cornerRadius(50)
                
                Spacer().frame(height: 100)
                
                // Print answers from an array
                
                ForEach(AnswerState, id: \.self) {  answer in
                    Button(action: {
                        currentQuestion = self.QuestionState
                        self.QuestionState = getNextQuestion(answer)
                        self.AnswerState = getNextAnswers
                        if (resultFlag == 1){
                            self.QuestionButtonBackColor = .white
                        }
                        if(answer == "Click here to see the results") {
                            self.buttonBackColor = .yellow
                        }
                        else if (answer == ""){
                            self.buttonBackColor = .white
                        }
                    }) {
                        
                        if (resultFlag == 1) {
                            NavigationLink(
                                destination: Result())
                            {
                                ZStack {
                                Text("").padding(.all,20).padding([.leading, .trailing], 100).background(Color.yellow).cornerRadius(30)
                                Text(answer).frame(height: 50).font(.headline).foregroundColor(.white)
                                }
                            }
                        }
                       // make an even bakcground under the buttons
                        else {
                        ZStack {
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor).cornerRadius(30)
                            Text(answer).frame(height: 20).font(.headline).foregroundColor(.white)
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
