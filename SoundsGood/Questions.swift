//
//  Questions.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/5/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

func update() {

    tags_list = ["breakfast", "lunch", "dinner", "dessert", "snack", "vegetarian", "doughy", "chewy", "crunchy", "sweet", "sour", "savory", "hot", "cold", "roomtemp", "$", "$$", "$$$", "healthy", "vegetables", "fired", "baked", "grilled", "milkproducts", "vegan", "sick", "junkfood", "mexican", "asian", "Italian/French", "Indian", "American", "Greek/Persian", "seafood", "chicken", "beef", "pork"]
    count = 1
    ResultList = []
    resultFlag = 0
}

struct Questions: View {
    
    @State private var QuestionState: String = "What type of meal do you think you would like?"
    @State private var AnswerState = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    
    @State private var buttonBackColor: Color = .green
    @State private var buttonBackColor2: Color = .green
    @State private var buttonBackColor3: Color = .green
    @State private var buttonBackColor4: Color = .green
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
                
                VStack {
                    Button(action: {
                        currentQuestion = self.QuestionState
                        if (currentQuestion == "What type of meal do you think you would like?") {
                            update()
                        }
                        self.QuestionState = getNextQuestion(self.AnswerState[0])
                        self.AnswerState = getNextAnswers
                        if (resultFlag == 1) {
                            self.QuestionButtonBackColor = .white
                            self.buttonBackColor = .white
                        }
                        if (self.AnswerState[1] != ""){ self.buttonBackColor2 = .green }
                        else { self.buttonBackColor2 = .white }
                        if (self.AnswerState[2] != ""){ self.buttonBackColor3 = .green }
                        else { self.buttonBackColor3 = .white }
                        if (self.AnswerState[3] != ""){ self.buttonBackColor4 = .green }
                        else { self.buttonBackColor4 = .white }
                    }) {
                        
                       // make an even bakcground under the buttons
                        
                        ZStack {
                            if (self.AnswerState[0] == "Click here to see the results") {
                                NavigationLink(destination: Result())
                                    {
                                        Text(self.AnswerState[0]).font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.orange).cornerRadius(50).frame(alignment: .leading)
                                }
                            }
                            else{
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor).cornerRadius(30)
                            Text(self.AnswerState[0]).frame(height: 20).font(.headline).foregroundColor(.white)
                            }
                        }
                    }
                    Button(action: {
                        currentQuestion = self.QuestionState
                        if (currentQuestion == "What type of meal do you think you would like?") {
                            update()
                        }
                        self.QuestionState = getNextQuestion(self.AnswerState[1])
                        self.AnswerState = getNextAnswers
                        if (resultFlag == 1) {
                            self.QuestionButtonBackColor = .white
                            self.buttonBackColor = .white
                        }
                        if (self.AnswerState[1] != ""){ self.buttonBackColor2 = .green }
                        else { self.buttonBackColor2 = .white }
                        if (self.AnswerState[2] != ""){ self.buttonBackColor3 = .green }
                        else { self.buttonBackColor3 = .white }
                        if (self.AnswerState[3] != ""){ self.buttonBackColor4 = .green }
                        else { self.buttonBackColor4 = .white }
                    }) {
                        
                       // make an even bakcground under the buttons
                        
                        ZStack {
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor2).cornerRadius(30)
                            Text(self.AnswerState[1]).frame(height: 20).font(.headline).foregroundColor(.white)
                        }
                    }
                    Button(action: {
                        currentQuestion = self.QuestionState
                        if (currentQuestion == "What type of meal do you think you would like?") {
                            update()
                        }
                        self.QuestionState = getNextQuestion(self.AnswerState[2])
                        self.AnswerState = getNextAnswers
                        if (resultFlag == 1) {
                            self.QuestionButtonBackColor = .white
                            self.buttonBackColor = .white
                        }
                        if (self.AnswerState[1] != ""){ self.buttonBackColor2 = .green }
                        else { self.buttonBackColor2 = .white }
                        if (self.AnswerState[2] != ""){ self.buttonBackColor3 = .green }
                        else { self.buttonBackColor3 = .white }
                        if (self.AnswerState[3] != ""){ self.buttonBackColor4 = .green }
                        else { self.buttonBackColor4 = .white }
                    }) {
                        
                       // make an even bakcground under the buttons
                       
                        ZStack {
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor3).cornerRadius(30)
                            Text(self.AnswerState[2]).frame(height: 20).font(.headline).foregroundColor(.white)
                        }
                    }
                    Button(action: {
                        currentQuestion = self.QuestionState
                        if (currentQuestion == "What type of meal do you think you would like?") {
                            update()
                        }
                        self.QuestionState = getNextQuestion(self.AnswerState[3])
                        self.AnswerState = getNextAnswers
                        if (resultFlag == 1) {
                            self.QuestionButtonBackColor = .white
                            self.buttonBackColor = .white
                        }
                        if (self.AnswerState[1] != ""){ self.buttonBackColor2 = .green }
                        else { self.buttonBackColor2 = .white }
                        if (self.AnswerState[2] != ""){ self.buttonBackColor3 = .green }
                        else { self.buttonBackColor3 = .white }
                        if (self.AnswerState[3] != ""){ self.buttonBackColor4 = .green }
                        else { self.buttonBackColor4 = .white }
                    }) {
                       // make an even bakcground under the buttons
                       
                        ZStack {
                            Text("").padding(.all,20).padding([.leading, .trailing], 100).background(self.buttonBackColor4).cornerRadius(30)
                            Text(self.AnswerState[3]).frame(height: 20).font(.headline).foregroundColor(.white)
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
