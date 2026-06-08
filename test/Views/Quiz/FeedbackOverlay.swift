//
//  FeedbackOverlay.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import SwiftUI

struct FeedbackOverlay: View {
    let imageName: String

    var body: some View {
        ZStack {
            Color.white.opacity(0.4)
                .ignoresSafeArea()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
        }
    }
}
