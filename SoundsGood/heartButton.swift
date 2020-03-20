//
//  heartButton.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/11/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

// MAX: Did not want to include this all in FavoriteList function

import SwiftUI

struct starButton: View {
    var foodName: String
    
    @State private var heartColor:Color = .red
    
    var body: some View {
        ForEach(getTagValuesForFood(foodName), id: \.self) {  tag in
            HStack {
                if (tag == "breakfast" && self.heartColor == .red) {
            Button(action: {
                    self.heartColor = .gray
        }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(self.heartColor).font(.system(size: 30))
            }
                }
                else if (tag == "breakfast" && self.heartColor == .gray) {
                    Button(action: {
                                self.heartColor = .red
                    }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(self.heartColor).font(.system(size: 30))
                    }
                }
            }
        }
        
    }
}
struct starButton_Previews: PreviewProvider {
    static var previews: some View {
        starButton(foodName: "CHICKEN")
    }
}
