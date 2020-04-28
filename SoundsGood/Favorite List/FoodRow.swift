import SwiftUI

struct FoodRow: View {
    var foodName: String
    var body: some View {
        HStack {
            getFoodImageFor(foodName)!
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(foodName)
            Spacer()
            HeartButton(foodName)
            Spacer().frame(width:30)
        }
    }
}
