//
//  Tags.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/9/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

class Row: Identifiable, ObservableObject {
    let id = UUID()
    @Published var cells: [Cell]
    
    init(_ cells: [Cell]) {
        self.cells = cells
    }
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
            
            while(index < tags.count && cellCount < (quadRow ? 4 : 3)) {
                row.append(Cell(ButtonData(tag: tags[index], state: .ignore)))
                index += 1
                cellCount += 1
            }
            
            quadRow = !quadRow
            rows.append(Row(row))
        }
        
        return rows
    }
}

class Cell: Identifiable, ObservableObject {
    let id = UUID()
    @Published var bData: ButtonData
    
    init(_ bData: ButtonData) {
        self.bData = bData
    }
}

struct Tags: View {
    var rows = Row.buildRows()
    var tagDict: [String: TagButton] = [:]
    @State var foods: [String] = []
    @State var isActive: Bool = false
    
    func updateFoods() {
        var tagStates: [String: TagState] = [:]
        for row in self.rows {
            for cell in row.cells {
                tagStates[cell.bData.tag] = cell.bData.state
            }
        }
        
        self.foods = tagQuery(tagStates)
        print("Foods: \(self.foods.count)")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer().frame(height: 20)
                    
                VStack {
                    ForEach(rows) { row in
                        HStack(alignment: .center) {
                            ForEach(row.cells) { cell in
                                TagButton(cell.bData).padding(-10)
                            }
                        }.padding(EdgeInsets.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                }.padding(EdgeInsets.init(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
                Spacer().frame(height: 60)
                    
                NavigationLink(destination: Results(title: "Tag Results", foods: self.$foods),
                               isActive: self.$isActive) { EmptyView() }
                    
                Button(action: {
                    self.updateFoods()
                    self.isActive = true
                }) {
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
            }.navigationBarTitle(Text("Tag Filter"), displayMode: .inline)
        }
    }
}


//.navigationBarItems(leading: Button(action: { self.isActive2 = false }, label: {  Image(systemName: "chevron.left")
//.aspectRatio(contentMode: .fit)
//    Text("Back") }))
