/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of food.
*/

import SwiftUI

struct FoodRow: View {
    var food: Food
    var body: some View {
        HStack {
            food.image
                    .resizable()
                    .frame(width: 100, height: 100)
            Text(food.FoodName)
            Spacer()
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodRow(food: foodData[0])
            FoodRow(food: foodData[1])
            FoodRow(food: foodData[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
