//
//  StoryView.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI

struct StoryView: View {
    let story: StoryModel = StoryData.stories[0]
    
    @AppStorage("score") var score: Int = 0
    @AppStorage("currentSceneIndex") var currentSceneIndex: Int = 0
    @AppStorage("currentDialogIndex") var currentDialogIndex: Int = 0
    @State private var showActions: Bool = false
    @State private var sceneHistory: [Int] = []
    @State private var animationTrigger: String = ""
    @State private var showActionSheet: Bool = false
    @State private var showEnding: Bool = false
    
    var currentScene: SceneModel {
        story.scenes[currentSceneIndex]
    }
    
    var currentDialog: DialogModel {
        currentScene.dialogs[currentDialogIndex]
    }
    
    var isLastDialog: Bool {
        currentDialogIndex == currentScene.dialogs.count - 1 && currentScene.actions == nil
    }
    
    func isActiveAsset(_ asset: AssetModel) -> Bool {
        if showActions { return false }
        return asset.type.dialogType == currentDialog.type
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Image(currentScene.background)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                // Characters
                ForEach(currentScene.assets) { asset in
                    AssetCharacter(
                        asset: asset,
                        isActive: isActiveAsset(asset),
                        animationTrigger: animationTrigger,
                        geometrySize: geometry.size
                    )
                }
                
                // Dialog bubble
                if let dialogPos = currentDialog.position {
                    DialogBubble(
                        dialog: currentDialog,
                        width: geometry.size.width * 0.3
                    )
                    .position(
                        x: geometry.size.width * dialogPos.x,
                        y: geometry.size.height * dialogPos.y
                    )
                }
                
                // Restart button
                StoryNavigationBar(onRestart: restartScene)
                
                // Actions
                if showActions, let actions = currentScene.actions {
                    ActionSheet(actions: actions) { action in
                        handleAction(action)
                    }
                }
                
                // Ending Screen
                if showEnding, let ending = currentScene.ending {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    EndingCard(ending: ending) {
                        showEnding = false
                        restartScene()
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .onTapGesture {
                if !showActions {
                    goToNext()
                }
            }
            .onAppear {
                animationTrigger = "\(currentSceneIndex)-\(currentDialog.id)"
            }
        }
    }
    
    func goToNext() {
        if currentDialogIndex < currentScene.dialogs.count - 1 {
            currentDialogIndex += 1
        } else if currentScene.actions != nil {
            withAnimation(.spring()) {
                showActions = true
            }
        } else if currentScene.ending != nil {
            withAnimation(.spring()) {
                showEnding = true
            }
        }
        animationTrigger = "\(currentSceneIndex)-\(currentDialog.id)"
    }
    
    func handleAction(_ action: ActionModel) {
        sceneHistory.append(currentSceneIndex)
        currentSceneIndex = action.nextScene - 1
        currentDialogIndex = 0
        withAnimation {
            showActions = false
        }
        DispatchQueue.main.async {
            animationTrigger = UUID().uuidString
        }
    }
    
    func restartScene() {
        currentSceneIndex = 0
        currentDialogIndex = 0
        showActions = false
        sceneHistory = []
        DispatchQueue.main.async {
            animationTrigger = UUID().uuidString
        }
    }
}

#Preview {
    StoryView()
}
