/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing food details (tags)
*/
import SwiftUI

struct FoodDetail: View {
    var food: Food
    var tags = ["hey", "heey"]

    var body: some View {
        ScrollView {
        VStack (alignment: .leading, spacing: 16) {
            
            food.image.resizable() .scaledToFit().frame(alignment: .top)
                        
                Text(food.FoodName).font(.title).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 30).background(Color.red).cornerRadius(50)
                
                
                Text("Tags:").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.gray).cornerRadius(30)
                          
                
                Text(food.Origin).font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)

        }
        .navigationBarTitle(Text(food.FoodName), displayMode: .inline)
        }
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: foodData[0])
    }
}
