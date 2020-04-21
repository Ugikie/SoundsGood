//
//  Result.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/24/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Result: View {
    
    var body: some View {
        
        NavigationView {
            List(ResultList, id:\.self) { foodName in
                 NavigationLink(destination: FoodDetail(foodName: foodName)) {
                  // prints picture and name in foodRow file
                      FoodRow(foodName: foodName)
                      
                      // also prints a star button to favorite / unfavorite
                      heartButton(foodName: foodName)
                      
                      Spacer().frame(width:30)

                }
            }
                    // this magic buttonStyle thing allows to have a button on top
                    //   of the NavigationLink row (button)
            .buttonStyle(BorderlessButtonStyle())
            .navigationBarTitle(Text("Results"))
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
            Result()
    }
}

