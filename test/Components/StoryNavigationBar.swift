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
                        .frame(width: 50, height: 50)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 2)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
            .padding(.trailing, 63)
            
            Spacer()
        }
        .frame(width: .infinity)
    }
}
