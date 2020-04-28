import SwiftUI

struct Results: View {
    var title: String = "Results"
    @Binding var foods: [String]
    
    var body: some View {
            List(self.foods, id:\.self) { foodName in
                 NavigationLink(destination: FoodDetail(foodName: foodName)) {
                    FoodRow(foodName: foodName)
            }
            .buttonStyle(BorderlessButtonStyle())
            .navigationBarTitle(Text(self.title))
        }
    }
}
