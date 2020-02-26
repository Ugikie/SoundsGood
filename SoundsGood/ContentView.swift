//
//  ContentView.swift
//  SoundsGood
//
//  Created by Austin Adam on 2/4/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Layers of images
        
        ZStack {
            
           // Background Here
            Rectangle().foregroundColor(Color.white).edgesIgnoringSafeArea(.all)
            VStack {
               
               // Sounds good logo
                Image("sglogo").resizable().aspectRatio(contentMode:.fit)
                
                    // divides (creates space between images)
                    Spacer().frame(height: 100)
                
               // fast food background image
                Image("burger").resizable().aspectRatio(contentMode:.fit)
                    
                    Spacer().frame(height: 100)
                
                // Main button!
                
                Button(action: {
                    // in development
                }) {
                    Text("LET'S GO").font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,20).padding([.leading, .trailing], 20).background(Color.green).cornerRadius(50)
                }
                
                
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
