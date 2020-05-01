//
//  QuestionView.swift
//  SoundsGood
//
//  Created by Andrew Miner on 4/30/20.
//  Copyright © 2020 MAAD Hungry. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    @State var qInfo: QInfo = QInfo("vegan")
    static var firstID: UUID = UUID()
    
    @State var lastResults: [String] = []
    @State var resultActive: Bool = false
    
    init(_ src_tag: String) {
        QInfo.resetSelection()
        self.qInfo = QInfo(src_tag)
        QuestionView.firstID = self.qInfo.id
    }
    
    func reset() {
        QInfo.resetSelection()
        qInfo = QInfo("vegan")
        QuestionView.firstID = self.qInfo.id
    }
    
    func selectAnswer(_ answer: String) {
        print("Answer: \(answer)")
        var ansIndex: Int? = nil
        for (index, str) in qInfo.answers.enumerated() {
            if(str == answer) {
                ansIndex = index
                break
            }
        }
        
        if let index = ansIndex {
            // Special case to make second
            // question about meal type
            if(self.qInfo.id == QuestionView.firstID) {
                self.qInfo.updateAnswer(index)
                QInfo.updateResults()
                self.lastResults = QInfo.getResults()
                qInfo = QInfo("breakfast")
            }
            else {
                let nextQ = self.qInfo.getNextQuestion(index)
                QInfo.updateResults()
                let foodResults = QInfo.getResults()
                
                if(nextQ == nil || foodResults.count <= 5) {
                    if(nextQ != nil && foodResults.count > 0) {
                        lastResults = foodResults
                    }
                    
                    self.resultActive = true
                    return
                }
                else { lastResults = foodResults }
                
                if let next = nextQ {
                    self.qInfo = next
                }
            }
        }
        else { self.resultActive = true }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer(minLength: 3)
                    Text(self.qInfo.question)
                        .font(.title)
                        .fontWeight(.semibold)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading, .trailing], 10)
                        .background(Color.red)
                        .cornerRadius(50)
                    Spacer(minLength: 3)
                }
                    
                Spacer(minLength: 75)
                
                ForEach(self.qInfo.answers, id: \.self) { ans in
                    Group {
                        Spacer(minLength: 25)
                        Button(action: {
                            self.selectAnswer(ans)
                        }) {
                            VStack {
                                Text(ans)
                                    .font(.title)
                                    .bold().foregroundColor(.white)
                                    .padding(.all, 10)
                                    .padding([.leading, .trailing], 10)
                                    .background(Color.green)
                                    .cornerRadius(50)
                                    .frame(alignment: .leading)
                            }
                        }
                    }
                }
                
                NavigationLink(
                    destination: Results(title: "Our Recommendation", foods: self.$lastResults).onAppear {
                        self.reset()
                    },
                    isActive: self.$resultActive) {
                    EmptyView()
                }
            }
        }
        
    }
}
