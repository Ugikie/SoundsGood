/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Food: Hashable, Codable, Identifiable{
    
    var FOOD: String
    var id: Int // required to be
    var Origin: String
    
    //Begin Tags
    var Breakfast: Int
    var Lunch: Int
    var Dinner: Int
    var Dessert: Int
    var Snack: Int
    var Vegetarian: Int
    var Doughy: Int
    var Chewy: Int
    var Crunchy: Int
    var Sweet: Int
    var Sour: Int
    var Savory: Int
    var Hot: Int
    var Cold: Int
    var Room_Temp: Int
    
    
    
    
    
    
    
    //End Tags
    
    
    
    
    fileprivate var imageName: String

}


extension Food {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
