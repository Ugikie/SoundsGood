/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of food.
*/

import SwiftUI

struct FavoriteList: View {
    var body: some View {
        NavigationView {
            List(foodData) { foodlist in
                NavigationLink(destination: FoodDetail(food: foodlist)) {
                    FoodRow(food: foodlist)
                }
            }
            .navigationBarTitle(Text("My Favorite Meals"))
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
