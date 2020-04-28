//
//  HeartButton.swift
//  SoundsGood
//
//  Created by Andrew Miner on 4/27/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct HeartButton: View {
    @ObservedObject var fList = favoriteFoods
    let foodName: String
    
    init(_ foodName: String) {
        self.foodName = foodName
    }
    
    func getColor() -> Color {
        if (isFavorite(foodName)) {
            return .red
        }
        else {
            return .gray
        }
    }
    
    var body: some View {
        Button(action: {
            setFavorite(isFavorite(self.foodName) ? 0 : 1, self.foodName)
        }) {
            Image(systemName: "heart.fill")
                .foregroundColor(getColor())
                .font(.system(size: 30))
        }
    }
}
