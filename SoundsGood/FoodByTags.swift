//
//  FoodByTags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/10/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct FoodByTags: View {
    
    
    var body: some View {
        
        VStack (spacing: 16) {
            
            Image("pizza").resizable().aspectRatio(contentMode:.fit)
       
            Text("Pizza!")
            
        } .navigationBarTitle(Text("PIZZA"), displayMode: .inline)
    }
}
