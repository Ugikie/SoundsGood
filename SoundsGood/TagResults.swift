//
//  TagResults.swift
//  SoundsGood
//
//  Created by Andrew Miner on 4/27/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct TagResults: View {
    @Binding var foods: [String]
    
    var body: some View {
        NavigationView {
            List(self.foods, id:\.self) { foodName in
                 NavigationLink(destination: FoodDetail(foodName: foodName)) {
                    FoodRow(foodName: foodName)
                    HeartButton(foodName)
                    Spacer().frame(width:30)
                }
            }.buttonStyle(BorderlessButtonStyle())
             .navigationBarTitle(Text("Results"))
        }
    }
}
