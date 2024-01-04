//
//  Trivia.swift
//  TriviaApp
//
//  Created by Jeff Barra on 1/4/24.
//

import Foundation

// JSON decodable
struct Trivia: Decodable {
    var results: [Result]
    
    // individual trivia question
    struct Result: Decodable, Identifiable {
        var id: UUID {
            // create instance of UUID
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        // converts the raw markdown text of the question into attributed string
        var formattedQuestion: AttributedString {
            do {
               return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        // Creates an array of answer objects based on the correct and incorrect answers
        var answers: [Answer] {
            do {
                // correct answer array
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                
                // incorrect answers
                let incorrects = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                // merge correct and incorrect answers together
                let allAnswers = correct + incorrects
                
                // randomize the answers
                return allAnswers.shuffled()
                
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
