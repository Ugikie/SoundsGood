/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/
import SwiftUI

struct FoodDetail: View {
    var food: Food
    
    // for test and demo. later gonna use database
    var tags = ["Breakfast", "Lunch", "Dinner", "Dessert", "Snack", "Vegetarian", "Doughy", "Chewy", "Crunchy", "Sweet", "Sour", "Savory", "Hot", "Cold", "Room_Temp"]
    
    
    var indes = 0

    var body: some View {
        
        
        ScrollView {
        
            VStack (alignment: .leading, spacing: 16) {
            
                Spacer().frame(height: 20)
                // Food image on top of detail page
            
                food.image.resizable() .scaledToFit().frame(alignment: .top)
                        
               // food NAME
            Text(food.FoodName).font(.title).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 30).background(Color.red).cornerRadius(50)
                
                
               // food TAGS
            Text("Tags:").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.gray).cornerRadius(30)
                        
            Text(food.Origin).font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                
            
                ForEach(tags, id: \.self) {  tag in
                    Button(action: {}) {
                            Text(tag)
                    }.font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                }
                
                // Navigation bar title is not necessary since we have food name in details already
            }.navigationBarTitle(Text(food.FoodName), displayMode: .inline)
            
        }
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: foodData[0])
    }
}
