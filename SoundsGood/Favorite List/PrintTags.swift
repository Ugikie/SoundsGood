//
//  PrintTags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/24/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

//
//struct PrintTags: View {
//
//    @State var foodName: String
//
//    var body: some View {
//        GeometryReader { geometry in
//            self.generateContent(in: geometry)
//        }
//    }
//
//    private func generateContent(in g: GeometryProxy) -> some View {
//        var width = CGFloat.zero
//        var height = CGFloat.zero
//
//
//        return ZStack(alignment: .topLeading) {
//            ForEach(getTagValuesForFood(self.foodName), id: \.self) { tag in
//                Button(action: {
//                    print("for Austin")
//                }) {
//                      if (tag != "isFavorite") {
//                    Text(tag.capitalized)
//                    .font(.body)
//                    .padding(.all, 5).padding([.leading, .trailing], 5)
//                    .font(.body)
//                    .background(Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(8)                    }
//                }
//                    .padding([.horizontal, .vertical], 4)
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width)
//                        {
//                            width = -50
//                            height -= (d.height + 10)
//
//                        }
//
//                        let result = width
//                        if tag == getTagValuesForFood(self.foodName).last! {
//                            width = -50
//                        } else {
//                            width -= d.width
//                        }
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        if tag == getTagValuesForFood(self.foodName).last! {
//                            height = 0
//                        }
//                        return result
//                    })
//            }
//        }
//    }
//}

struct PrintTags: View {
    
    @State var foodName: String

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero


        return ZStack(alignment: .topLeading) {
            ForEach(getTagValuesForFood(self.foodName), id: \.self) { tag in
                Button(action: {
                    print("for Austin")
                }) {
                      if (tag != "isFavorite") {
                    Text(tag.capitalized)
                    .font(.body)
                    .padding(.all, 5).padding([.leading, .trailing], 5)
                    .font(.body)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)                    }
                }
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = -50
                            height -= (d.height + 10)
                            
                        }
                    
                        let result = width
                        if tag == getTagValuesForFood(self.foodName).last! {
                            width = -50
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == getTagValuesForFood(self.foodName).last! {
                            height = 0
                        }
                        return result
                    })
            }
        }
    }
}
