/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of food.
*/

import SwiftUI

struct FavoriteList: View {
    var body: some View {
        NavigationView {
            List(listOfFoodNames, id:\.self) { foodName in
                NavigationLink(destination: FoodDetail(foodName: foodName)) {
                    FoodRow(foodName: foodName)
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
