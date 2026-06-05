//
//  StoryNavigationBar.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI

struct StoryNavigationBar: View {
    let onHome: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    onHome()
                } label: {
                    Image("btn home")
                        .resizable()
                        .frame(width: 75, height: 75)
                }
                .accessibilityLabel("Go-Back")
                .accessibilityAddTraits(.isButton)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .padding(.trailing, 60)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StoryNavigationBar(onHome: {})
}
