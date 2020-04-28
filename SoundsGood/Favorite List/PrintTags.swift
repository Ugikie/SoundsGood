//
//  PrintTags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/24/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI


struct PrintTags: View {
    
    var fName: String
    @State var tagResults: [String] = []
    @State var isActive: Bool = false
    
    init(foodName: String) {
        fName = foodName
        isActive = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    func tagSearch(_ tag: String) {
        let tagState: [String: TagState] = [tag : .include,
                                            "isFavorite" : .exclude]
        let favoriteState: [String: TagState] = [tag : .include,
                                                 "isFavorite" : .include]
        tagResults = tagQuery(favoriteState)
        tagResults.append(contentsOf: tagQuery(tagState))
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero


        let tagValues = getTagValuesForFood(self.fName)
        return ZStack(alignment: .topLeading) {
            ForEach(tagValues, id: \.self) { tag in
                NavigationLink(destination: Results(title: tag, foods: self.$tagResults)) {
                    Text(tag.capitalized)
                        .font(.body)
                        .padding(.all, 5).padding([.leading, .trailing], 5)
                        .font(.body)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .padding([.horizontal, .vertical], 4)
                .alignmentGuide(.leading, computeValue: { d in
                    if (abs(width - d.width) > g.size.width) {
                        width = -50
                        height -= (d.height + 10)
                    }
                        
                    let result = width
                    if tag == tagValues.last! {
                        width = -50
                    } else {
                        width -= d.width
                    }
                        
                    return result
                })
                .alignmentGuide(.top, computeValue: { d in
                    let result = height
                    if tag == tagValues.last! {
                        height = 0
                    }
                        
                    return result
                })
                .simultaneousGesture(TapGesture().onEnded {
                    self.tagSearch(tag)
                })
            }
        }
    }
}
