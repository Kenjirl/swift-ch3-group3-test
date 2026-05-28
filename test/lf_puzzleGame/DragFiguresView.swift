//
//  DragFiguresView.swift
//  test
//
//  Created by Calogero Friscia on 25/05/26.
//

import SwiftUI
import Combine

// MARK: - Model

struct DragItem: Identifiable {
    
    let id: String = UUID().uuidString
    let asset: String
    var defaultRotation:CGFloat = 0
}

// MARK: - ViewModel

internal class DragViewModel: ObservableObject {

    let dragItems: [DragItem] = [
        DragItem(asset: "puzzle_broccolo",defaultRotation: 25),
        DragItem(asset: "puzzle_toast"),
        DragItem(asset: "puzzle_tomato"),
        DragItem(asset: "puzzle_egg"),
        DragItem(asset: "puzzle_watermellon"),
        DragItem(asset: "puzzle_nasi"),
    ]

    /// Returns 2 rows of 3 randomly distributed items.
    func getThreeItemPerRaw() -> [[DragItem]] {
        var pool = dragItems
        var row1 = [DragItem]()

        for _ in 0..<3 {
            if let pick = pool.randomElement() {
                pool.removeAll(where: { $0.id == pick.id })
                row1.append(pick)
            }
        }
        // shuffle the remaining 3 so row2 is also random
        return [row1, pool.shuffled()]
    }
}

// MARK: - Main Scene

struct MiniGameMainScene: View {

    @StateObject private var puzzleVM: DragViewModel = DragViewModel()

    var body: some View {

        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            let mealBoxArea   = w * 0.70
            let mealBoxFrame  = w * 0.65
            let draggableArea = w * 0.30
            let topPadding    = h * 0.09   // vertical → usa height ✓
            let trailingPad   = w * 0.05

            ZStack {

                LinearGradient(
                    colors: [Color.mainBackgroundTop, Color.mainBackgroundBottom],
                    startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

                HStack(spacing: 0) {

                    // MARK: Box area
                    VStack(alignment: .leading) {
                        MealBoxOpen()
                            .frame(width: mealBoxFrame)
                            .padding(.top, topPadding)
                            .padding(.trailing, trailingPad)
                        
                        Text("Ohh explanation")
                        Spacer()
                    }
                    .frame(width: mealBoxArea)
                    .background(Color.red)     // debug

                    // MARK: Draggable area
                    VStack { }
                    .frame(width: draggableArea)
                    .background(Color.yellow)  // debug
                }
            }
        }
        .environmentObject(puzzleVM)
    }
}





#Preview {
    MiniGameMainScene()
}
