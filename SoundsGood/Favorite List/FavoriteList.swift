


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
                 NavigationLink(destination: FoodDetail(foodName)) {
                    FoodRow(foodName: foodName)
                }
            }
                    // this magic buttonStyle thing allows to have a button on top
                    //   of the NavigationLink row (button)
            .buttonStyle(BorderlessButtonStyle())
                
            .navigationBarTitle(Text("My Favorite Meals"))
            .navigationBarItems(trailing: NavigationLink(
                destination: FoodSearch(foodNames: fList.listData.sorted(), title: "Search Favorites"))
                {
                    Text("Search")
                    Image(systemName: "magnifyingglass.circle.fill")
                    
                }
             )

        }
    }
}
