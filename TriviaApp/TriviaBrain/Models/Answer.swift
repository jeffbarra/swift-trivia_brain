//
//  Answer.swift
//  TriviaApp
//
//  Created by Jeff Barra on 1/3/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
