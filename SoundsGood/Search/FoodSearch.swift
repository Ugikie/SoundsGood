//
//  FoodSearch.swift
//  SoundsGood
//
//  Created by Max Bogatyrev on 3/26/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

// MAX: This code was mostly copied from the tutorial

import SwiftUI

struct FoodSearch: View {
    var foodNames = getFoodNames().sorted()
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var isPresented = false

    var body: some View {

       // NavigationView {
            VStack {
                //Spacer().frame(height: 50)
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true)
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)

                List {
                    // Filtered list of names
                    ForEach(foodNames.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in
                        NavigationLink(destination: FoodDetail(searchText)) {
                            // prints picture and name in foodRow file
                            FoodRow(foodName: searchText)
                            
                            Spacer().frame(width:30)

                        }                       // print(searchText)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .navigationBarTitle(Text("Search Food"))
            }
        }
    }
//}



struct FoodSearch_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           FoodSearch()
              .environment(\.colorScheme, .light)

           FoodSearch()
              .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
