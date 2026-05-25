//
//  ContentView.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetX: CGFloat = 0
    @State private var screenWidth: CGFloat = UIScreen.main.bounds.width

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .offset(x: offsetX)
            .animation(.spring(), value: offsetX)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
            
            ZStack {
                HStack {
                    Button(action: {
                        let limit = screenWidth / 2 - 40
                        offsetX = max(offsetX - 50, -limit)
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        let limit = screenWidth / 2 - 40
                        offsetX = min(offsetX + 50, limit)
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}
