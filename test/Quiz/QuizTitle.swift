//
//  QuizTitle.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import SwiftUI

struct QuizTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.custom("Fredoka", size: 30))
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}
