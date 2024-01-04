//
//  TriviaView.swift
//  TriviaApp
//
//  Created by Jeff Barra on 1/3/24.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        // when user finishes trivia game
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .ourCustomTitle()
                
                Text("Congrats! You've completed the game!! 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                    .fontWeight(.bold)
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
            .navigationBarBackButtonHidden()
        } else {
            QuestonView()
                .environmentObject(triviaManager)
        }
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
