/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/

import SwiftUI

struct FoodDetail: View {
    var food: Food

    var tag = ["hey", "heey"]
    
    var body: some View {
        VStack {
            
        Text(tag[0])
            

        }
        .navigationBarTitle(Text(food.FoodName), displayMode: .inline)
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: foodData[0])
    }
}
