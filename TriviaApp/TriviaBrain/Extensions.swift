//
//  Extensions.swift
//  TriviaApp
//
//  Created by Jeff Barra on 1/3/24.
//

import Foundation
import SwiftUI

extension Text {
    func ourCustomTitle() -> some View {
        self .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
