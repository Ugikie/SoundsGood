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
    
    // This state will help to prevent bugs, as well as help to keep track of the heart color. Green means INITIAL color when favorite tab is opened
    @State private var heartColor:Color = .green
    
    var body: some View {
            
        HStack {
            if (self.heartColor == .green && checkIsFavorite(self.foodName) == .red) {
            Button(action: {
                setIsFavorite(0, self.foodName)
                self.heartColor = .gray
        }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
            }
            }
            else if (self.heartColor == .green && checkIsFavorite(self.foodName) == .gray) {
                Button(action: {
                    setIsFavorite(1, self.foodName)
                    self.heartColor = .red
            }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
                }
                }
            else if (self.heartColor == .red) {
                Button(action: {
                    setIsFavorite(0, self.foodName)
                    self.heartColor = .gray
            }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(checkIsFavorite(self.foodName)).font(.system(size: 30))
                }
            }
            else if (self.heartColor == .gray) {
                    Button(action: {
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
