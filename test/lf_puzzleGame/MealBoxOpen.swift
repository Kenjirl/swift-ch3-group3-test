//
//  MealBoxOpen.swift
//  test
//
//  Created by Calogero Friscia on 28/05/26.
//

import SwiftUI
// MARK: - Box View

struct MealBoxOpen: View {

    @EnvironmentObject var puzzleVM: DragViewModel

    /// Items stored in @State: calcolati una volta sola all'onAppear,
    /// non ricalcolati ad ogni re-render.
   // @State private var items: [[DragItem]] = []

    var body: some View {

        Image("puzzle_box")
            .resizable()
            .scaledToFit()                    // box è l'ancora del frame
            .overlay(MealOverlayGrid())
            .onPreferenceChange(SlotFrameKey.self) { frames in
                puzzleVM.slotFrames = frames
            }
            .overlay(alignment: .topTrailing, content: {
                Button {
                    puzzleVM.setItemsForPuzzleMiniGame()
                    puzzleVM.resetGame.toggle()
                    AudioManager.shared.playAudioEffect(.puzzleSnap)
                    
                } label: {
                    Text("refresh")
                } // for test

            })
//            .onAppear {
//               /* items = */puzzleVM.getThreeItemPerRaw()
//            }
    }
}

// MARK: - Grid Overlay

struct MealOverlayGrid: View {

    @EnvironmentObject var puzzleVM:DragViewModel
   // let items: [[DragItem]]

    var body: some View {

        GeometryReader { geo in
            let w = geo.size.width // essendo applicato in overlay al meal box, legge la sua larghezza
            let h = geo.size.height // altezza meal box

            // Margini interni al box
            let hPad = w * 0.08
            let vPad = h * 0.10

            // Superficie disponibile dopo i margini
            let innerW = w - hPad * 2
            let innerH = h - vPad * 2

            // Proporzioni dei 3 scomparti del vassoio
            let leftW = innerW * 0.40   // scomparto sinistro (40%)
            let rightW = innerW * 0.60   // scomparti destri   (60%)
            let topH = innerH * 0.42   // scomparto alto      (42%)
            let bottomH = innerH * 0.30   // scomparto basso     (30%)

            let rowSpacing = innerH * 0.15

            // Scomparto sinistro
            let leftTopOffsetX = rowSpacing * 0.70  // item [0][0] spostato a destra
            let leftVerticalPad = rowSpacing * 0.20  // padding verticale

            // Top-right
            let topRightOverlap = -rightW * 0.15     // avvicina i due item orizzontalmente

            // Bottom-right
          //  let bottomItemSpacing = rowSpacing * 0.15
            let bottomLeadPad = rowSpacing * 0.90
            let bottomTrailPad = rowSpacing * 0.10
          //  let bottomItemScale   = 0.85              // scala ridotta item sovrapposto

            // Posizione verticale del frame
            let centerY = h / 2.15                   // compensa il padding visivo del vassoio

            HStack(alignment: .center, spacing: 0) {

                // ── Scomparto sinistro: 40% larghezza, altezza piena
                // items[0][0] sopra, items[1][0] sotto
                VStack(alignment: .leading, spacing: 0) {
                    slotView(row: 0, col: 0)
                        .offset(x: leftTopOffsetX)
                    slotView(row: 1, col: 0)
                        .offset(x: -rowSpacing)
                }
                .padding(.vertical, leftVerticalPad)
                .frame(width: leftW, height: innerH)

                // ── Scomparti destri: 60% larghezza, split 42 / 30
                VStack(spacing: rowSpacing) {

                    // Top-right: items[0][1] e items[0][2]
                    HStack(spacing: topRightOverlap) {
                        slotView(row: 0, col: 1)
                        slotView(row: 0, col: 2)
                    }
                    .frame(width: rightW, height: topH)

                    // Bottom-right: items[1][1] e items[1][2]
                    HStack(spacing: -10) {
                        slotView(row: 1, col: 1)
//                        slotView(row: 1, col: 3)
//                            .scaleEffect(0.75)
                        slotView(row: 1, col: 2)
                    }
                    
                    .padding(.leading, bottomLeadPad)
                    .padding(.trailing, bottomTrailPad)
                    .frame(width: rightW, height: bottomH)
                }
            }
            .frame(width: innerW, height: innerH)
            .position(x: w / 2, y: centerY)
        }
    }

    // Renderizza lo slot e pubblica il suo frame in canvas space tramite SlotFrameKey
    @ViewBuilder
    private func slotView(row: Int, col: Int) -> some View {
        
        let item = puzzleVM.itemsForPuzzleMiniGame[ifExists: row]?[ifExists: col]
        
        puzzleVM.slotImage(row: row, col: col)
//            .overlay(content: {
//                Image(systemName: "questionmark.circle.dashed")
//                   
//            })
            .blendMode(.destinationOut)
            .opacity(0.4)
            .background(
                GeometryReader { geo in
                    Color.clear.preference(
                        key: SlotFrameKey.self,
                        value: item.map { [$0.id: geo.frame(in: .named("canvas"))] } ?? [:]
                    )
                }
            )
    }
}
