/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/
import SwiftUI

struct FoodDetail: View {
    var foodName: String
    
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
            
            PrintTags(foodName: foodName)
        }.navigationBarTitle(Text(foodName), displayMode: .inline)
    }
}


struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(foodName: "Chicken Nuggets")
    }
}


