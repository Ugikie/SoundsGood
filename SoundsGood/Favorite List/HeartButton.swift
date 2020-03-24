//
//  heartButton.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/11/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

// MAX: Did not want to include this all in FavoriteList function

import SwiftUI

struct heartButton: View {
    var foodName: String
    
    @State private var heartColor:Color = .red
    
    var body: some View {
        ForEach(getTagValuesForFood(foodName), id: \.self) {  tag in
            HStack {
                if (tag == "isFavorite" && self.heartColor == .red) {
            Button(action: {
                
                // AUSTIN ADD ACTION TO CHANGE TAG TO 0
                
                    self.heartColor = .gray
        }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(self.heartColor).font(.system(size: 30))
            }
                }
                else if (tag == "isFavorite" && self.heartColor == .gray) {
                    Button(action: {
                        
                        // AUSTIN ADD ACTION TO CHANGE TAG BACK TO 1
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
struct heartButton_Previews: PreviewProvider {
    static var previews: some View {
        heartButton(foodName: "CHICKEN")
    }
}
