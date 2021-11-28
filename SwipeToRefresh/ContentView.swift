//
//  ContentView.swift
//  SwipeToRefresh
//
//  Created by Federico on 28/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var items: Int = 1
    @State private var randomNumbers: [Int] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(randomNumbers, id: \.self) { item in
                    let color = item == randomNumbers.max() ? Color.green : Color.black
                    
                    Text("\(item)")
                        .foregroundColor(color)
                        .bold()
                        .padding()
                }
                
            }.refreshable {
                // Put the logic that you want to be refreshed
                print("Refreshing...")
                getRandomNumbers()
            }
            .navigationTitle("Random No")
            .onAppear(perform: getRandomNumbers)
        }
    }
    
    func getRandomNumbers() {
        // Empty list before assigning new values
        randomNumbers = []
        
        // Generate 10 random numbers
        for i in 1...10 {
            let randNum = Int.random(in: 0...100)
            randomNumbers.append(randNum)
        }
        
        // Shuffle the list for extra randomness
        randomNumbers.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
