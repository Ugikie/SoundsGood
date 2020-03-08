//
//  Questions.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/5/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Questions: View {
    
    // for test and demo. later gonna use database
    var answers = ["Cafe", "Restaurant", "Fast Food"]
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Text("Where do you wanna eat?").font(.title).fontWeight(.semibold).bold().foregroundColor(.white).padding(.all,10).padding([.leading, .trailing], 10).background(Color.red).cornerRadius(50)
                
                Spacer().frame(height: 100)
                
                ForEach(answers, id: \.self) {  answer in
                    Button(action: {}) {
                        ZStack {
                           
                       // make an even bakcground under the buttons
                            Text("").padding(.all,5).padding([.leading, .trailing], 100).background(Color.green).cornerRadius(30)
                            
                            Text(answer).frame(height: 50).font(.subheadline).foregroundColor(.white)
                        }
    
                    }
     
                }
                
            }
            
        }
        
    }
    
}

struct Questions_Previews: PreviewProvider {
    static var previews: some View {
        Questions()
    }
}
