/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of food.
*/

import SwiftUI

struct FavoriteList: View {
    
    var body: some View {
            
        NavigationView {
            
            List(favoriteFoods, id:\.self) { foodName in
                    NavigationLink(destination: FoodDetail(foodName: foodName)) {
                    // prints picture and name in foodRow file
                    FoodRow(foodName: foodName)
                    
                    // also prints a star button to favorite / unfavorite
                    heartButton(foodName: foodName)
                    
                    Spacer().frame(width:30)

                }
            }
                    // this magic buttonStyle thing allows to have a button on top
                    //   of the NavigationLink row (button)
            .buttonStyle(BorderlessButtonStyle())
                
            .navigationBarTitle(Text("My Favorite Meals"))
            .navigationBarItems(trailing: Button(action: {
                 // Maybe to add food later on????
                  
                } ) {
                    // plus on top right corner to add new food to favorites. --- From the whole DB of food?
                    // LET'S MAKE A SEARCH OF MEALS/FOOD
                Text("Search")
                Image(systemName: "plus")
                    .resizable()
                    .padding(6)
                    .frame(width: 24, height: 24)
                    .background(Color.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            } )

        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
            FavoriteList()
    }
}
