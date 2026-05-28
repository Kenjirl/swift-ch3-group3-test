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

    @Published var itemsForPuzzleMiniGame: [[DragItem]] = []
    @Published var slotFrames: [String: CGRect] = [:]
    
    
    let dragItems: [DragItem] = [
        DragItem(asset: "puzzle_broccolo",defaultRotation: 25),
        DragItem(asset: "puzzle_toast"),
        DragItem(asset: "puzzle_tomato"),
        DragItem(asset: "puzzle_egg"),
        DragItem(asset: "puzzle_watermellon"),
        DragItem(asset: "puzzle_nasi"),
    ]

    /// Returns 2 rows of 3 randomly distributed items.
    func setItemsForPuzzleMiniGame()/* -> [[DragItem]]*/ {
        var pool = dragItems
        var row1 = [DragItem]()

        for _ in 0..<3 {
            if let pick = pool.randomElement() {
                pool.removeAll(where: { $0.id == pick.id })
                row1.append(pick)
            }
        }
        // shuffle the remaining 3 so row2 is also random
      //  return [row1, pool.shuffled()]
        itemsForPuzzleMiniGame = [row1, pool.shuffled()]
    }
    
    func itemID(row: Int, col: Int) -> String {
        itemsForPuzzleMiniGame[ifExists: row]?[ifExists: col]?.id ?? ""
    }

    // Helper: accesso sicuro + immagine
    @ViewBuilder
    func slotImage(row: Int, col: Int) -> some View {
        if let item = itemsForPuzzleMiniGame[ifExists: row]?[ifExists: col] {
            Image(item.asset)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .rotationEffect(.degrees(item.defaultRotation))
        }
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
                    VStack { DraggbleArea() }
                    .frame(width: draggableArea)
                    .background(Color.yellow)  // debug
                }
            }
            .coordinateSpace(name: "canvas")
            .onAppear {
               /* items = */puzzleVM.setItemsForPuzzleMiniGame()
            }
        }
        .environmentObject(puzzleVM)
    }
}

struct DragItemView<DragElement: View>: View {

    @EnvironmentObject var puzzleVM: DragViewModel

    let itemID: String
    @ViewBuilder let element: () -> DragElement

    @State private var offset: CGSize = .zero // handle the movement
   // @State private var baseOffset: CGSize = .zero
    @State private var ownCenter: CGPoint = .zero // the starting position
    @State private var startignSize:CGSize = .zero
    
    @State private var isDragEnable:Bool = true
    
    @State private var scaledSize:CGSize = CGSize(width: 0.75, height: 0.75)
    
    var body: some View {
        
        ZStack {
            
            // the placeholder
            
            element()
                .scaleEffect(CGSize(width: 0.75, height: 0.75))
                .opacity(0.6)
                .background(
                    GeometryReader { geo in
                        
                        Color.clear
                            .onAppear {
                                let frame = geo.frame(in: .named("canvas"))
                                ownCenter = CGPoint(x: frame.midX, y: frame.midY)
                                startignSize = frame.size
                            }
                    }
                )
                .background(content: {
                    Color.itemBackground
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .scaleEffect(0.9)
                })
            
            // the object moved
            element()
                .scaleEffect(scaledSize)
                .offset(offset)
                .gesture(drag,isEnabled: isDragEnable)
            
        }
    }

    private var drag: some Gesture {
        DragGesture()
            .onChanged { move in
                
                offset = CGSize(
                    width: move.translation.width,
                    height: move.translation.height
                )

            }
            .onEnded { _ in
                
                guard let target = puzzleVM.slotFrames[itemID] else {
                    // there is not target - if happen its an error
                    // its handle going back to the start position
                    withAnimation(.spring()) { offset = .zero }
                    return
                }
                
                // get the distance from the target to the draggable starting point
                let snap = CGSize(
                    width:  target.midX - ownCenter.x,
                    height: target.midY - ownCenter.y
                )
                
                // check distance from the current point
                let wDistance = snap.width - offset.width // is zero when its on the snap position
                let hDistance = snap.height - offset.height
                
                if wDistance > -50,
                   wDistance < 50,
                   hDistance > -45,
                   hDistance < 45 {
                    
                    // calculate the scale beetween the target and the origin
                    let scaleX = target.size.width  / startignSize.width
                    let scaleY = target.size.height / startignSize.height
                    
                    let scaleZ = min(scaleX, scaleY)
                    
                    withAnimation(.spring()) {
                        
                        scaledSize = CGSize(width: scaleZ, height: scaleZ) // to be proportioned w and h must be scaled equally
                        offset = snap
                    }
                    
                    isDragEnable = false
                    
                } else {
                    withAnimation(.spring()) {
                        offset = .zero
                        scaledSize = CGSize(width: 0.75, height: 0.75)
                      //  self.scaleValue = 0.75
                    }
                    
                }
            }
    }
}

struct DraggbleArea:View {
    
    @EnvironmentObject var puzzleVM:DragViewModel
    
    var body: some View {
        
        VStack(spacing: 25) {

            HStack {
                DragItemView(itemID: puzzleVM.itemID(row: 0, col: 2)) {
                    puzzleVM.slotImage(row: 0, col: 2)
                }
                DragItemView(itemID: puzzleVM.itemID(row: 1, col: 0)) {
                    puzzleVM.slotImage(row: 1, col: 0)
                }
            }

            HStack {
                DragItemView(itemID: puzzleVM.itemID(row: 0, col: 1)) {
                    puzzleVM.slotImage(row: 0, col: 1)
                }
                DragItemView(itemID: puzzleVM.itemID(row: 1, col: 1)) {
                    puzzleVM.slotImage(row: 1, col: 1)
                }
            }

            HStack {
                DragItemView(itemID: puzzleVM.itemID(row: 0, col: 0)) {
                    puzzleVM.slotImage(row: 0, col: 0)
                }
                DragItemView(itemID: puzzleVM.itemID(row: 1, col: 2)) {
                    puzzleVM.slotImage(row: 1, col: 2)
                }
            }

        }
       // .scaleEffect(0.75)
        
    }
    

    
}



#Preview {
    MiniGameMainScene()
}
