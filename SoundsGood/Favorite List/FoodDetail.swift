/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/
import SwiftUI

struct FoodDetail: View {
    var foodName: String
    
    init(_ food: String) {
        self.foodName = food
        getID(food)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer(minLength: 10)
            
            getFoodImageFor(foodName)!
                .resizable()
                .frame(width: 360.0, height: 360.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                            
            HStack {
                Text(foodName)
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(alignment: .topLeading)
                HeartButton(foodName)
            }
            Spacer().frame(height: 30)
            HStack {
                NavigationLink(
                    destination: Restaurants(foodName: foodName))
                {
                    Text("Search Nearby Restaurants").font(.headline).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,20).padding([.leading, .trailing], 30).background(Color.green).cornerRadius(50) }
            }
            
            PrintTags(foodName: foodName)
            
            
        }.navigationBarTitle(Text(foodName), displayMode: .inline)
    }
}


