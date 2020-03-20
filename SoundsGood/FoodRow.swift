/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of food.
*/

import SwiftUI

struct FoodRow: View {
    //var food: Food
    var foodName: String
    var body: some View {
        HStack {
            getFoodImageFor(foodName)!
                    .resizable()
                    .frame(width: 100, height: 100)
            
            Text(foodName)
            Spacer()
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FoodRow(foodName: listOfFoodNames[0])
            FoodRow(foodName: listOfFoodNames[1])
            FoodRow(foodName: listOfFoodNames[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
