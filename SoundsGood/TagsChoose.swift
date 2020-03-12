//
//  Tags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/9/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI



struct Tags: View {
    
    
    // demo: initially a row of buttons(tags) is gray
    // one click - green, 2 clicks - red
    
    @State private var buttonBackColor1:Color = .gray
    @State private var buttonBackColor2:Color = .gray
    @State private var buttonBackColor3:Color = .gray
    @State private var buttonBackColor4:Color = .gray
    @State private var buttonBackColor5:Color = .gray
    @State private var buttonBackColor6:Color = .gray
    @State private var buttonBackColor7:Color = .gray
    @State private var buttonBackColor8:Color = .gray
    @State private var buttonBackColor9:Color = .gray
    @State private var buttonBackColor10:Color = .gray
    @State private var buttonBackColor11:Color = .gray
    @State private var buttonBackColor12:Color = .gray
    @State private var buttonBackColor13:Color = .gray
    @State private var buttonBackColor14:Color = .gray
    
    // list of tags divided in lines. 4, 3, 4, 3 and so on
    
    let tags1 = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    let tags2 = ["Snack", "Vegetarian", "Doughy"]
    let tags3 = ["Chewy", "Crunchy", "Sweet", "Sour"]
    let tags4 = ["Savory", "Hot", "Cold"]
    
    //DEMO: try to store tags in array. works ONLY on GREEN color!
     @State private var tags_index = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    var body: some View {
        
        ScrollView {
        
            Spacer().frame(height: 160)
            
            ZStack {
                
                
            VStack (spacing: 16) {
                ZStack {
                    HStack {
                        Circle().fill(self.buttonBackColor1).frame(width: 90, height: 90)
                        Circle().fill(self.buttonBackColor2).frame(width: 90, height: 90)
                        Circle().fill(self.buttonBackColor3).frame(width: 90, height: 90)
                        Circle().fill(self.buttonBackColor4).frame(width: 90, height: 90)

                    }
                HStack {
                ForEach(tags1, id: \.self) {  tag in
                                   Button(action: {
                                    if (tag == "Breakfast") {
                                    if (self.buttonBackColor1 == .gray) {
                                        self.tags_index[0] = 1
                                        self.buttonBackColor1 = .green
                                    } else if self.buttonBackColor1 == .green {
                                        self.buttonBackColor1 = .red
                                    } else {
                                        self.buttonBackColor1 = .gray
                                    }
                                    }
                                    else if (tag == "Lunch") {
                                    if (self.buttonBackColor2 == .gray) {
                                        self.tags_index[1] = 1
                                        self.buttonBackColor2 = .green
                                    } else if self.buttonBackColor2 == .green {
                                        self.buttonBackColor2 = .red
                                    } else {
                                        self.buttonBackColor2 = .gray
                                    }
                                    }
                                    else if (tag == "Dinner") {
                                    if (self.buttonBackColor3 == .gray) {
                                        self.tags_index[2] = 1
                                        self.buttonBackColor3 = .green
                                    } else if self.buttonBackColor3 == .green {
                                        self.buttonBackColor3 = .red
                                    } else {
                                        self.buttonBackColor3 = .gray
                                    }
                                    }
                                    else if (tag == "Dessert") {
                                    if (self.buttonBackColor4 == .gray) {
                                        self.tags_index[3] = 1
                                        self.buttonBackColor4 = .green
                                    } else if self.buttonBackColor4 == .green {
                                        self.buttonBackColor4 = .red
                                    } else {
                                        self.buttonBackColor4 = .gray
                                    }
                                    }
                                   }) {
                                       ZStack {
                                          
                                      // make a circle under the buttons
                                        // it wil change clors once button is clicked
                                           
                                           Text(tag).frame(width: 90, height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                                   }
                               }
                }
                
                }
                ZStack {
                HStack {
                    Circle().fill(self.buttonBackColor5).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor6).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor7).frame(width: 90, height: 90)
                }
                HStack {
                ForEach(tags2, id: \.self) {  tag in
                                   Button(action: {
                                    if (tag == "Snack") {
                                    if (self.buttonBackColor5 == .gray) {
                                        self.tags_index[4] = 1
                                        self.buttonBackColor5 = .green
                                    } else if self.buttonBackColor5 == .green {
                                        self.buttonBackColor5 = .red
                                    } else {
                                        self.buttonBackColor5 = .gray
                                    }
                                    }
                                    else if (tag == "Vegetarian") {
                                    if (self.buttonBackColor6 == .gray) {
                                        self.tags_index[5] = 1
                                        self.buttonBackColor6 = .green
                                    } else if self.buttonBackColor6 == .green {
                                        self.buttonBackColor6 = .red
                                    } else {
                                        self.buttonBackColor6 = .gray
                                    }
                                    }
                                    else if (tag == "Doughy") {
                                    if (self.buttonBackColor7 == .gray) {
                                        self.tags_index[6] = 1
                                        self.buttonBackColor7 = .green
                                    } else if self.buttonBackColor7 == .green {
                                        self.buttonBackColor7 = .red
                                    } else {
                                        self.buttonBackColor7 = .gray
                                    }
                                    }
                                   }) {
                                       ZStack {
                                          
                                      // make a circle under the buttons
                                        
                                           
                                           Text(tag).frame(width: 90, height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
                }
                ZStack {
                HStack {
                    Circle().fill(self.buttonBackColor8).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor9).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor10).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor11).frame(width: 90, height: 90)
                }
                HStack {
                ForEach(tags3, id: \.self) {  tag in
                                   Button(action: {
                                    if (tag == "Chewy") {
                                    if (self.buttonBackColor8 == .gray) {
                                        self.tags_index[7] = 1
                                        self.buttonBackColor8 = .green
                                    } else if self.buttonBackColor8 == .green {
                                        self.buttonBackColor8 = .red
                                    } else {
                                        self.buttonBackColor8 = .gray
                                    }
                                    }
                                    else if (tag == "Crunchy") {
                                    if (self.buttonBackColor9 == .gray) {
                                        self.tags_index[8] = 1
                                        self.buttonBackColor9 = .green
                                    } else if self.buttonBackColor9 == .green {
                                        self.buttonBackColor9 = .red
                                    } else {
                                        self.buttonBackColor9 = .gray
                                    }
                                    }
                                    else if (tag == "Sweet") {
                                    if (self.buttonBackColor10 == .gray) {
                                        self.tags_index[9] = 1
                                        self.buttonBackColor10 = .green
                                    } else if self.buttonBackColor10 == .green {
                                        self.buttonBackColor10 = .red
                                    } else {
                                        self.buttonBackColor10 = .gray
                                    }
                                    }
                                    else if (tag == "Sour") {
                                    if (self.buttonBackColor11 == .gray) {
                                        self.tags_index[10] = 1
                                        self.buttonBackColor11 = .green
                                    } else if self.buttonBackColor11 == .green {
                                        self.buttonBackColor11 = .red
                                    } else {
                                        self.buttonBackColor11 = .gray
                                    }
                                    }
                                   }) {
                                       ZStack {
                                          
                                      // make a circle under the buttons
                                        
                                           Text(tag).frame(width: 90, height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
                }
                ZStack {
                HStack {
                    Circle().fill(self.buttonBackColor12).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor13).frame(width: 90, height: 90)
                    Circle().fill(self.buttonBackColor14).frame(width: 90, height: 90)
                }
                HStack {
                ForEach(tags4, id: \.self) {  tag in
                                   Button(action: {
                                    if (tag == "Savory") {
                                    if (self.buttonBackColor12 == .gray) {
                                         self.tags_index[11] = 1
                                        self.buttonBackColor12 = .green
                                    } else if self.buttonBackColor12 == .green {
                                        self.buttonBackColor12 = .red
                                    } else {
                                        self.buttonBackColor12 = .gray
                                    }
                                    }
                                    else if (tag == "Hot") {
                                    if (self.buttonBackColor13 == .gray) {
                                         self.tags_index[12] = 1
                                        self.buttonBackColor13 = .green
                                    } else if self.buttonBackColor13 == .green {
                                        self.buttonBackColor13 = .red
                                    } else {
                                        self.buttonBackColor13 = .gray
                                    }
                                    }
                                    else if (tag == "Cold") {
                                    if (self.buttonBackColor14 == .gray) {
                                         self.tags_index[13] = 1
                                        self.buttonBackColor14 = .green
                                    } else if self.buttonBackColor14 == .green {
                                        self.buttonBackColor14 = .red
                                    } else {
                                        self.buttonBackColor14 = .gray
                                    }
                                    }
                                   }) {
                                       ZStack {
                                          
                                      // make a circle under the buttons
                                        
                                           Text(tag).frame(width: 90, height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                    }
                }
                }.navigationBarTitle(Text("CHOOSE TAGS"), displayMode: .inline)
                
                }
            
                Spacer().frame(height: 60)
            
                NavigationLink(destination: FoodByTags())
                                   {
                                    Text("Continue").font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(50).frame(alignment: .leading)
                                   }
            }
        }
     }

struct Tags_Previews: PreviewProvider {
    static var previews: some View {
        Tags()
    }
}
