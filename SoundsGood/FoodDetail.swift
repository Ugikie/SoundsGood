/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct FoodDetail: View {
    var food: Food

    var body: some View {
        VStack {

            VStack() {
                
            Text(food.FOOD)
                    .font(.title).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 30).background(Color.red).cornerRadius(50)
                
                
                Spacer().frame(height: 40)
            Text("Tags:").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.gray).cornerRadius(30)
                
                Spacer().frame(height: 40)
            Text(food.Origin).font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)

                
                Spacer().frame(height: 10)
                
                // It cannot do more than 10 tags in one HStack. so we got two rows of them
                
                HStack() {
                    
                    if food.Breakfast == 1 {
                        Text("Breakfast").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Lunch == 1 {
                        Text("Lunch").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Dinner == 1 {
                        Text("Dinner").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Dessert == 1 {
                        Text("Dessert").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Snack == 1 {
                        Text("Snack").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Vegetarian == 1 {
                        Text("Vegetarian").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Doughy == 1 {
                        Text("Doughy").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Chewy == 1 {
                        Text("Chewy").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Crunchy == 1 {
                        Text("Crunchy").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Sweet == 1 {
                        Text("Sweet").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                }
                 
                Spacer().frame(height: 10)
        
                HStack() {
                    
                    if food.Sour == 1 {
                        Text("Sour").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Savory == 1 {
                        Text("Savory").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Hot == 1 {
                        Text("Hot").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Cold == 1 {
                        Text("Cold").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                    if food.Room_Temp == 1 {
                        Text("Room Temperature").font(.subheadline).foregroundColor(.white).padding(.all,5).padding([.leading, .trailing], 10).background(Color.green).cornerRadius(30)
                    }
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(food.FOOD), displayMode: .inline)
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(food: foodData[0])
    }
}
