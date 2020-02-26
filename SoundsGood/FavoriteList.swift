//
//  FavoriteList.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 2/25/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct FavoriteList: View {
    
    let FoodList = List.parsFoodList()
    
    
    var body: some View {
        
        
        NavigationView {
                
                VStack {
                    
                    HStack (alignment: .top) {
                        
                        Image("pizza").resizable().frame(width: 120, height: 120)
                            
                        
                        
                            VStack {
                                
                                Text("Pizza").font(.title).fontWeight(.medium)
                            
                                Text("Pizza").font(.title).fontWeight(.medium)
                                
                                
                            }
                        
                    }
                    
                    }.navigationBarTitle(Text("Favorite List"))
                
        }
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
