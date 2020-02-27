/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct FavoriteList: View {
    var body: some View {
        NavigationView {
            List(foodData) { food in
                NavigationLink(destination: FoodDetail(food: food)) {
                    FoodRow(food: food)
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
