/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/
import SwiftUI

struct FoodDetail: View {
    
    var foodName: String
    
    var body: some View {
      
        ZStack {
        VStack {
            
                // Food image on top of detail page
                getFoodImageFor(foodName)!
                    .resizable().frame(width: 360.0, height: 360.0)
        }.offset(y: -100)
            
        
        VStack {
               // food NAME
            Text(foodName).font(.title).foregroundColor(.black).frame(width: 360, alignment: .topLeading)
                
        }.offset(y: 100)
        
        VStack  {
            
            Spacer().frame(height: 380)
                
            PrintTags(foodName: foodName)
                
                
                // Navigation bar title is not necessary since we have food name in details already
            }
        }.navigationBarTitle(Text(foodName), displayMode: .inline).offset(y: -60)
    }
}


struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(foodName: "Chicken Nuggets")
    }
}


