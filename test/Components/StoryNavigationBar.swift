//
//  StoryNavigationBar.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI

struct StoryNavigationBar: View {
    let onRestart: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    onRestart()
                } label: {
                    Image("btn-setting")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)
            }
            .padding(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
