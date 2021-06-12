//
//  ContentView.swift
//  MiniGame
//
//  Created by Артем Репин on 12.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = Int.random(in: 0...100)
    @State private var value = 0.0
    @State private var showAlert = false
    
    var body: some View {
        
        
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(score)")
            HStack {
                Text("0")
                SliderKit(value: $value, score: computeScore())
                Text("100")
            }.padding(.vertical, 40)
            Button("Проверь меня!", action: showResults)
                .alert(isPresented: $showAlert){
                    Alert(
                        title: Text("Ваш счет"),
                        message: Text("\(Int(computeScore()))")
                    )
                }
                .padding(.bottom, 40)
            Button("Начать заново", action: startAgain)
        }.padding()
    }
    
    private func startAgain() {
        score = Int.random(in: 0...100)
    }
    private func showResults() {
        showAlert.toggle()
    }
    
    private func computeScore() -> Int {
        let difference = abs(score - lround(value))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
