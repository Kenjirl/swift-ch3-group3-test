//
//  StoryView.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI

struct StoryView: View {
    
    @EnvironmentObject var vm:ViewModel
    @Environment(\.dismiss) var dismiss
    
    let story: StoryModel //= StoryData.stories[0]
    
    @AppStorage("score") var score: Int = 0
    @AppStorage("currentSceneIndex") var currentSceneIndex: Int = 0
    @AppStorage("currentDialogIndex") var currentDialogIndex: Int = 0
    @AppStorage("checkpoint") var checkpoint: Int = 0
    
    @State private var showActions: Bool = false
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
                if !showActions, let dialogPos = currentDialog.position {
                    DialogBubble(
                        dialog: currentDialog
                    )
                    .position(
                        x: geometry.size.width * dialogPos.x,
                        y: geometry.size.height * dialogPos.y
                    )
                }
                
                // Restart button
                StoryNavigationBar(onHome: goToHome)
                
                // Actions
                if showActions, let actions = currentScene.actions {
                    ActionSheet(actions: actions) { action in
                        handleAction(action)
                    }
                }
                
                // Ending Screen
                if showEnding, let ending = currentScene.ending {
                    EndingCard(
                        ending: ending,
                        onHome: {
                            goToHome()
                        },
                        onRestart: {
                            showEnding = false
                            restartScene()
                        },
                        onProceed: {
                            handleEnding(ending)
                        },
                        hasNext: ending.nextScene != nil
                    )
                    .transition(.opacity)
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
		.navigationBarBackButtonHidden(true)
    }
	
    
    func goToNext() {
        if currentDialogIndex < currentScene.dialogs.count - 1 {
            currentDialogIndex += 1
        } else if currentScene.actions != nil {
            withAnimation(.spring()) { showActions = true }
        } else if currentScene.ending != nil {
            withAnimation(.spring()) { showEnding = true }
        } else if let next = currentScene.nextScene {
            if currentScene.triggerMiniGame {
                vm.moveScreenState(to: .miniGame)
                currentSceneIndex += 1
                currentDialogIndex = 0
            }
            else { navigateTo(next) }
        }
        animationTrigger = "\(currentSceneIndex)-\(currentDialog.id)"
    }

    func handleAction(_ action: ActionModel) {
        withAnimation { showActions = false }
        navigateTo(action.nextScene)
    }

    func handleEnding(_ ending: EndingModel) {
        if let next = ending.nextScene {
            withAnimation { showEnding = false }
            navigateTo(next)
        }
    }

    func navigateTo(_ sceneNumber: Int) {
        currentSceneIndex = sceneNumber - 1
        currentDialogIndex = 0
        updateCheckpoint()
        DispatchQueue.main.async {
            animationTrigger = UUID().uuidString
        }
    }
    
    func updateCheckpoint() {
        if currentScene.checkPoint {
            checkpoint = currentSceneIndex
        }
    }
    
    func restartScene() {
        currentSceneIndex = checkpoint
        currentDialogIndex = 0
        showActions = false
        showEnding = false
        DispatchQueue.main.async {
            animationTrigger = UUID().uuidString
        }
    }
    
    func goToHome() {
        dismiss()
        vm.moveScreenState(to: .menu)
        reset()
    }
    
    func reset() {
        checkpoint = 0
        currentSceneIndex = 0
        currentDialogIndex = 0
        showActions = false
        showEnding = false
        DispatchQueue.main.async {
            animationTrigger = UUID().uuidString
        }
    }
}

#Preview {
    let _ = UserDefaults.standard.set(0, forKey: "currentSceneIndex")
    let _ = UserDefaults.standard.set(0, forKey: "currentDialogIndex")
    StoryView(story: StoryData.storie_1(player: .male))
}
