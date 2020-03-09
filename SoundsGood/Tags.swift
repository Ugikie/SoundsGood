//
//  Tags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/9/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI



struct Tags: View {
    
    var tags1 = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    var tags2 = ["Snack", "Vegetarian", "Doughy"]
    var tags3 = ["Chewy", "Crunchy", "Sweet", "Sour"]
    var tags4 = ["Savory", "Hot", "Cold"]
    
    var body: some View {
        
        ScrollView {
        
            Spacer().frame(height: 200)
            
            ZStack {
            VStack (spacing: 16) {
                HStack {
                ForEach(tags1, id: \.self) {  tag in
                                   Button(action: {}) {
                                       ZStack {
                                          
                                      // make an even bakcground under the buttons
                                           Circle()
                                           .fill(Color.gray)
                                           .frame(width: 90, height: 90)
                                           
                                           Text(tag).frame(height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
                HStack {
                ForEach(tags2, id: \.self) {  tag in
                                   Button(action: {}) {
                                       ZStack {
                                          
                                      // make an even bakcground under the buttons
                                           Circle()
                                           .fill(Color.gray)
                                           .frame(width: 90, height: 90)
                                           
                                           Text(tag).frame(height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
                HStack {
                ForEach(tags3, id: \.self) {  tag in
                                   Button(action: {}) {
                                       ZStack {
                                          
                                      // make an even bakcground under the buttons
                                           Circle()
                                           .fill(Color.gray)
                                           .frame(width: 90, height: 90)
                                           
                                           Text(tag).frame(height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
                HStack {
                ForEach(tags4, id: \.self) {  tag in
                                   Button(action: {}) {
                                       ZStack {
                                          
                                      // make an even bakcground under the buttons
                                           Circle()
                                           .fill(Color.gray)
                                           .frame(width: 90, height: 90)
                                           
                                           Text(tag).frame(height: 50).font(.subheadline).foregroundColor(.white)
                                       }
                   
                                   }
                    
                               }
                }
            }.navigationBarTitle(Text("CHOOSE TAGS"), displayMode: .inline)
            }
        }
        
        
    }
}

struct Tags_Previews: PreviewProvider {
    static var previews: some View {
        Tags()
    }
}
