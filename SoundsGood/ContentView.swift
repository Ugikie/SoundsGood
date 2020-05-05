//
//  ContentView.swift
//  SoundsGood
//
//  Created by Austin Adam on 2/4/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State  var showingInfo = false
    let qView = QuestionView(FIRST_Q)
    
    var body: some View {
        // Layers of images
        NavigationView {
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
                
                    //Main button!
                
                    NavigationLink(destination: qView, isActive: self.$isActive) {
                        EmptyView()
                    }
                    Button(action: {
                        self.qView.reset()
                        self.isActive = true
                    }) {
                        Text("LET'S GO")
                            .font(.title)
                            .fontWeight(.semibold)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all,20)
                            .padding([.leading, .trailing], 20)
                            .background(Color.green)
                            .cornerRadius(50)
                    }
                        
                }
                
                VStack {
                    
                    HStack {
                        Spacer().frame(width: 350)
                        Button(action: {
                            self.showingInfo.toggle()
                        }) {
                            Image(systemName: "info.circle").font(.system(size: 35)).foregroundColor(.green)
                        }.sheet(isPresented: $showingInfo) {
                            info()
                        }
                    }
                    Spacer().frame(height: 670)
                }
            }
        }
    }
}

struct info: View {
    
    var body: some View {
        ZStack {
            VStack{
            Text("Sounds Good” is an app that provides you an easy and convenient way of deciding what to eat. It works in a similar way as the classic game \"20 Questions\". You are asked a series of questions about different categories of food and spices. With the final result you have a change to search for the restaurants or places around you where you can find the food that you liked. Sounds good?\n\n\n\n\n\n\n\n\n\n\n\n").frame(width: 300).multilineTextAlignment(.center)
            Text("Copyright © 2020 SoundsGood, inc. All rights reserved.").frame(width: 330).font(.callout).multilineTextAlignment(.center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
