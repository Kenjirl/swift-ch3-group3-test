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
                    Image(systemName: "arrow.trianglehead.clockwise")
                        .frame(width: 40, height: 40)
                        .background(Color(red: 255/255, green: 154/255, blue: 134/255))
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .bold()
                }
                .shadow(color: .white.opacity(0.5), radius: 4, x: 0, y: 2)
            }
            .padding(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
