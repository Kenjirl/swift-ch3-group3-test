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
    @Published var itemsDragged:Int = 0
    @Published var slotFrames: [String: CGRect] = [:]
    
  //  @Published var resetGame:Bool = false // for test
    var gameEnded:Bool { itemsDragged == 6 /* can be hardcoded, because we know its always six. */ }
    
    let dragItems: [DragItem] = [
        DragItem(asset: "puzzle_broccolo",defaultRotation: 25),
        DragItem(asset: "puzzle_toast"),
        DragItem(asset: "puzzle_tomato"),
        DragItem(asset: "puzzle_egg"),
        DragItem(asset: "puzzle_watermellon"),
        DragItem(asset: "puzzle_nasi"),
        DragItem(asset: "puzzle_kiwi"),
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
    
    @EnvironmentObject var vm:ViewModel
    @StateObject private var puzzleVM: DragViewModel = DragViewModel()
    
    @AppStorage("playerCharacter") var playerCharacter: String = CharacterData.female.rawValue
    @AppStorage("currentSceneIndex") var currentSceneIndex: Int = 0
    @AppStorage("currentDialogIndex") var currentDialogIndex: Int = 0
    @AppStorage("checkpoint") var checkpoint: Int = 0

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

                GradientColor.gameBackground
                .ignoresSafeArea()

                HStack {

                    // MARK: Box area
                    VStack(alignment: .leading) {
                        
                        MealBoxOpen()
                            .frame(width: mealBoxFrame)
                           // .padding(.top, topPadding)
                           // .padding(.trailing, trailingPad)

                        Text("What Friend bring for lunch?")
                            .foregroundStyle(Color.accentPink)
                            .fontWeight(.semibold)
                            .font(.custom("Fredoka", size: 24))
                        
                        Text("Place the food in the lunchbox to see!")
                            .foregroundStyle(Color.accentPink)
                            .font(.custom("Fredoka", size: 20))
                           
                        
                        Spacer()
                    }
                    .frame(width: mealBoxArea)
                   // .background(Color.red)     // debug

                    // MARK: Draggable area
                  //  VStack {  }
                    DraggbleArea()
                    // .padding(.top, topPadding)
                    .frame(width: draggableArea)
                  //  .background(Color.yellow)  // debug
                }
                .ignoresSafeArea()
                .padding(.top, topPadding)
                .padding(.trailing, trailingPad)
                .opacity(puzzleVM.gameEnded ? 0.3 : 1.0)
                .overlay {
                    if puzzleVM.gameEnded {
                        Image("puzzle_end_remark")
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(0.75)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                vm.moveScreenState(to: .storie(
                                    StoryData.storie_1(
                                        player: CharacterData(rawValue: playerCharacter) ?? .female
                                    )
                                ))
                            }
                    }
                }
                .animation(.easeInOut(duration: 1.5), value: puzzleVM.gameEnded)
                
                VStack {
                    StoryNavigationBar(onHome: goToHome)
                }
                .ignoresSafeArea()
                .offset(x: 35)
            }
            .coordinateSpace(name: "canvas")
            .onAppear {
              puzzleVM.setItemsForPuzzleMiniGame()
            }
        }
        .environmentObject(puzzleVM)
    }
    
    func goToHome() {
        vm.moveScreenState(to: .storie(
            StoryData.storie_1(
                player: CharacterData(rawValue: playerCharacter) ?? .female
            )
        ))
        currentSceneIndex -= 1
        currentDialogIndex = StoryData.storie_1(player: .female).scenes[currentSceneIndex].dialogs.count - 1
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
    @State private var target:CGRect?
    
    @State private var dragStep:DragStep = .zero
    
    @State private var scaledSize:CGSize = CGSize(width: 0.75, height: 0.75)
    
    var body: some View {
        
        ZStack {
            
            // the placeholder
            
            element()
                .scaleEffect(CGSize(width: 0.75, height: 0.75))
                .opacity(0.5)
                .background(
                    GeometryReader { geo in
                        
                        Color.clear
                            .onAppear {
                                let frame = geo.frame(in: .named("canvas"))
                                ownCenter = CGPoint(x: frame.midX, y: frame.midY)
                                startignSize = frame.size
                                target = puzzleVM.slotFrames[itemID]
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
                .gesture(drag,isEnabled: dragStep != .done)
               
        }
        .onChange(of: dragStep) { _, newValue in

            switch newValue {
                
            case .detach:
                AudioManager.shared.playAudioEffect(.puzzleDetach)
            case .done:
                AudioManager.shared.playAudioEffect(.puzzleSnap)
                puzzleVM.itemsDragged += 1
            case .nearby:
                AudioManager.shared.playAudioEffect(.puzzleNearby)
            case .wrong:
                AudioManager.shared.playAudioEffect(.puzzleTrash)
            case .zero:
                return
            }

        }
//        .onChange(of: puzzleVM.resetGame) { _, newValue in
//            offset = .zero
//        } // for test purpose
    }

    private enum DragStep {
        
        case detach
        case nearby
        case wrong
        case done
        
        case zero
        
    }
    
    private func getSnap() -> CGSize? {
        
        guard let target else { return nil }
        
        return CGSize(
            width:  target.midX - ownCenter.x,
            height: target.midY - ownCenter.y
        )
    }
    
    private func checkIsNearby() -> Bool {
        
        guard let snap = getSnap() else { return false }
        
        // check distance from the current point
        let wDistance = snap.width - offset.width // is zero when its on the snap position
        let hDistance = snap.height - offset.height
        
        return wDistance > -50 &&
               wDistance < 50 &&
               hDistance > -45 &&
               hDistance < 45
    }
    
    private var drag: some Gesture {
        DragGesture()
            .onChanged { move in

                if offset == .zero {
                    dragStep = .detach
                }

                offset = CGSize(
                    width: move.translation.width,
                    height: move.translation.height
                )

                if checkIsNearby() {
                    dragStep = .nearby
                } else if dragStep == .nearby {
                    dragStep = .zero
                }
            }
            .onEnded { _ in
                
                guard let target /*= puzzleVM.slotFrames[itemID]*/
                else {
                    // there is not target - if happen its an error
                    // its handle going back to the start position
                    withAnimation(.spring()) { offset = .zero }
                    return
                }
                
                if checkIsNearby(),
                       let snap = getSnap() {
                    
                    // calculate the scale beetween the target and the origin
                    let scaleX = target.size.width  / startignSize.width
                    let scaleY = target.size.height / startignSize.height
                    
                    let scaleZ = min(scaleX, scaleY)
                    
                    withAnimation(.spring()) {
                        
                        scaledSize = CGSize(width: scaleZ, height: scaleZ) // to be proportioned w and h must be scaled equally
                        offset = snap
                    }
                    
                    dragStep = .done
                    
                } else {
                    withAnimation(.spring()) {
                        offset = .zero
                        scaledSize = CGSize(width: 0.75, height: 0.75)
                    }
                    dragStep = .wrong
                    Task { @MainActor in dragStep = .zero }
                }
            }
    }
}

struct DraggbleArea:View {
    
    @EnvironmentObject var puzzleVM:DragViewModel
    
    var body: some View {

        GeometryReader { geo in
            let itemSize = geo.size.width / 2

            VStack(spacing: 5) {

                HStack {
                    DragItemView(itemID: puzzleVM.itemID(row: 0, col: 2)) {
                        puzzleVM.slotImage(row: 0, col: 2)
                    }
                    .frame(width: itemSize, height: itemSize)

                    DragItemView(itemID: puzzleVM.itemID(row: 1, col: 0)) {
                        puzzleVM.slotImage(row: 1, col: 0)
                    }
                    .frame(width: itemSize, height: itemSize)
                }

                HStack {
                    DragItemView(itemID: puzzleVM.itemID(row: 0, col: 1)) {
                        puzzleVM.slotImage(row: 0, col: 1)
                    }
                    .frame(width: itemSize, height: itemSize)

                    DragItemView(itemID: puzzleVM.itemID(row: 1, col: 1)) {
                        puzzleVM.slotImage(row: 1, col: 1)
                    }
                    .frame(width: itemSize, height: itemSize)
                }

                HStack {
                    DragItemView(itemID: puzzleVM.itemID(row: 0, col: 0)) {
                        puzzleVM.slotImage(row: 0, col: 0)
                    }
                    .frame(width: itemSize, height: itemSize)

                    DragItemView(itemID: puzzleVM.itemID(row: 1, col: 2)) {
                        puzzleVM.slotImage(row: 1, col: 2)
                    }
                    .frame(width: itemSize, height: itemSize)
                }

            }
           // .padding(.top)
        }
    }
}



#Preview {
    MiniGameMainScene()
}
