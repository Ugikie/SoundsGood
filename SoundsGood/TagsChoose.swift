//
//  Tags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/9/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct Row: Identifiable {
    let id = UUID()
    let cells: [Cell]
}

extension Row {
    static let tags = getTags()
    static func buildRows() -> [Row] {
        var rows: [Row] = []
        var index = 0
        var quadRow = true
        while (index < tags.count) {
            var row: [Cell] = []
            var cellCount = 0;
            
            while(index < tags.count && cellCount < (quadRow ? 3 : 2)) {
                row.append(Cell(bData: ButtonData(tag: tags[index], state: .ignore)))
                index += 1
                cellCount += 1
            }
            
            quadRow = !quadRow
            rows.append(Row(cells: row))
        }
        
        return rows
    }
}

struct Cell: Identifiable {
    let id = UUID()
    let bData: ButtonData
}

struct Tags: View {
    let rows = Row.buildRows()
    var tagDict: [String: TagButton] = [:]
    
    var body: some View {
        
        ScrollView {
            Spacer().frame(height: 20)
            
            VStack {
                ForEach(rows) { row in
                    HStack(alignment: .center) {
                        ForEach(row.cells) { cell in
                            TagButton(cell.bData)
                        }
                    }
                }
            }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
            
            Spacer().frame(height: 60)
            
            NavigationLink(destination: FoodByTags()) {
                Text("Continue")
                    .font(.title)
                    .fontWeight(.semibold)
                    .bold().foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 10)
                    .background(Color.green)
                    .cornerRadius(50)
                    .frame(alignment: .leading)
            }
        }.navigationBarTitle(Text("CHOOSE TAGS"), displayMode: .inline)
    }
}


//.navigationBarItems(leading: Button(action: { self.isActive2 = false }, label: {  Image(systemName: "chevron.left")
//.aspectRatio(contentMode: .fit)
//    Text("Back") }))
