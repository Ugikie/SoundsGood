//
//  TagButton.swift
//  SoundsGood
//
//  Created by Andrew Miner on 4/20/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI


enum TagState {
    case include
    case exclude
    case ignore
}

class ButtonData: ObservableObject {
    let tag: String
    @Published var state: TagState
    
    init(tag: String, state: TagState) {
        self.tag = tag
        self.state = state
    }
}

struct TagButton: View {
    @State private var curState: TagState = .ignore
    var data: ButtonData
    
    init(_ data: ButtonData) {
        self.data = data
    }
    
    func getColor() -> Color {
        switch self.curState {
        case .ignore:
            return .gray
        case .include:
            return .green
        case .exclude:
            return .red
        }
    }
    
    var body: some View {
        Button(action: {
            switch self.curState {
            case .ignore:
                self.curState = .include
                self.data.state = .include
            case .include:
                self.curState = .exclude
                self.data.state = .exclude
            case .exclude:
                self.curState = .ignore
                self.data.state = .ignore
            }
        }) {
            Text(self.data.tag)
                .font(.subheadline)
                .fontWeight(.semibold)
                .bold()
                .frame(width: 90, height: 50)
                .foregroundColor(.white)
        }.buttonStyle(CircleButtonStyle(self))
    }
    
    struct CircleButtonStyle: ButtonStyle {
        var button: TagButton
        init(_ button: TagButton) {
            self.button = button
        }
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label.padding().background(Circle().fill(button.getColor()))
        }
    }
}
