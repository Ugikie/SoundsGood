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
    var body: some View {
        TabView {
                  ContentView()
                      .tabItem {
                          Image(systemName: "s.circle.fill")
                          Text("Main")
                      }

                  Text("Favorites")
                        .tabItem {
                            Image(systemName: "1.square.fill")
                            Text("Favorites")
                  }
            
                  Text("Previous Orders")
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("Previous")
                  }
            
                  Text("Food Scanner")
                        .tabItem {
                            Image(systemName: "3.square.fill")
                            Text("Scan")
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
