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
    
    
    
    @State private var heartColor:Color = .green
    
    var body: some View {
        //ForEach(getTagValuesForFood(foodName), id: \.self) {  tag in
            
        HStack {
                
            if (self.heartColor == .green && checkIsFavorite(self.foodName) == .red) {
            Button(action: {
                print("here1")
                setIsFavorite(0, self.foodName)
                self.heartColor = .gray
        }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
            }
            }
            else if (self.heartColor == .green && checkIsFavorite(self.foodName) == .gray) {
                Button(action: {
                    print("here2")
                    setIsFavorite(1, self.foodName)
                    self.heartColor = .red
            }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
                }
                }
            else if (self.heartColor == .red) {
                Button(action: {
                    print("here3")
                    setIsFavorite(0, self.foodName)
                    self.heartColor = .gray
            }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
                }
            }
            else if (self.heartColor == .gray) {
                    Button(action: {
                        print("here4")
                        setIsFavorite(1, self.foodName)
                        self.heartColor = .red
                    }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
                    }
                }
            
            
            }
        //}
        
    }
}
struct heartButton_Previews: PreviewProvider {
    static var previews: some View {
        heartButton(foodName: "CHICKEN")
    }
}
