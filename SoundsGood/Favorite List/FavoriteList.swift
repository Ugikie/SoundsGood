/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of food.
*/

import SwiftUI

struct FavoriteList: View {
    @ObservedObject private var fList = favoriteFoods
    
    var body: some View {
        NavigationView {
            List(fList.listData.sorted(), id:\.self) { foodName in
                 NavigationLink(destination: FoodDetail(foodName: foodName)) {
                    FoodRow(foodName: foodName)
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .navigationBarTitle(Text("My Favorite Meals"))
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
            FavoriteList()
    }
}
