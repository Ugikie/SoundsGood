//
//  AppView.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 2/24/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//



// This part is for TabView, a bar on the bottom of the screen. There are 4 buttons

import SwiftUI

struct AppView: View {
    let tagFilter = Tags()
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Main")
                }

            FavoriteList()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }

            tagFilter
                .onAppear { self.tagFilter.reset() }
                .tabItem {
                    Image(systemName: "circle.grid.2x2.fill")
                    Text("Choose Tags")
                }
            
            
            FoodSearchTab()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                    
                }
        }
        .font(.headline)
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
