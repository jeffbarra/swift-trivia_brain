//
//  ContentView.swift
//  TriviaApp
//
//  Created by Jeff Barra on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    // initialize TriviaManager
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    Text("Trivia Game")
                    // import our custom title from "Extensions"
                        .ourCustomTitle()
                    
                    Text("Are you ready to test your knowledge?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    PrimaryButton(text: "I'm Ready!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(.white)
        }
    }
}

#Preview {
    ContentView()
}
