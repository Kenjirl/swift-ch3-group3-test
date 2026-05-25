//
//  TestView.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 22/05/26.
//

import SwiftUI

struct TestView: View {
    let story: StoryModel = TestData.stories[0]
    
    @State private var currentSceneIndex: Int = 0
    @State private var currentDialogIndex: Int = 0
    @State private var showActions: Bool = false
    @State private var sceneHistory: [Int] = []
    
    var currentScene: SceneModel {
        story.scenes[currentSceneIndex]
    }
    
    var currentDialog: DialogModel {
        currentScene.dialogs[currentDialogIndex]
    }
    
    var isFirstDialog: Bool {
        sceneHistory.isEmpty && currentSceneIndex == 0 && currentDialogIndex == 0
    }
    
    var isLastDialog: Bool {
        currentDialogIndex == currentScene.dialogs.count - 1 && currentScene.actions == nil
    }
    
    var playerCharacter: String? {
        for scene in story.scenes {
            if let dialog = scene.dialogs.first(where: { $0.type == .player }) {
                return dialog.character
            }
        }
        return nil
    }
    
    func resolvedX(_ position: CharacterPosition, for type: DialogType) -> CGFloat {
        if type == .character {
            return 1.0 - position.x
        }
        return position.x
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Image(currentScene.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Karakter
                if !showActions && currentDialog.type != .narrator {
                    if let charPos = currentDialog.characterPosition {
                        Image(currentDialog.character ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geometry.size.height * 0.4)
                            .position(
                                x: geometry.size.width * resolvedX(charPos, for: currentDialog.type),
                                y: geometry.size.height * charPos.y
                            )
                    }
                }
                
                // Dialog bubble
                if !showActions {
                    if let dialogPos = currentDialog.dialogPosition {
                        VStack(alignment: currentDialog.type == .narrator ? .center : currentDialog.type == .player ? .leading : .trailing, spacing: 4) {
                            if let name = currentDialog.name {
                                Text(name)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: currentDialog.type == .player ? .leading : .trailing)
                            }
                            
                            Text(currentDialog.text)
                                .frame(maxWidth: .infinity, alignment: currentDialog.type == .narrator ? .center : currentDialog.type == .player ? .leading : .trailing)
                        }
                        .padding()
                        .frame(width: geometry.size.width * 0.7)
                        .background(Color.white)
                        .cornerRadius(12)
                        .position(
                            x: geometry.size.width * resolvedX(dialogPos, for: currentDialog.type),
                            y: geometry.size.height * dialogPos.y
                        )
                    }
                }

                VStack {
                    Spacer()
                    
                    // Actions
                    if showActions, let actions = currentScene.actions {
                        VStack(spacing: 0) {
                            HStack(spacing: 8) {
                                ForEach(actions) { action in
                                    Button(action.text) {
                                        sceneHistory.append(currentSceneIndex)
                                        let nextIndex = action.nextScene - 1
                                        currentSceneIndex = nextIndex
                                        currentDialogIndex = 0
                                        showActions = false
                                    }
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white.opacity(0.9))
                                    .cornerRadius(8)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                        }
                    }
                    
                    // Navigasi (saat dialog)
                    HStack {
                        if !isFirstDialog {
                            Button("Prev") {
                                goToPrev()
                            }
                            .padding(10)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        if !showActions && !isLastDialog {
                            Button("Next") {
                                goToNext()
                            }
                            .padding(10)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .padding(.bottom)
                }
            }
        }
    }
    
    func goToNext() {
        let dialogs = currentScene.dialogs
        
        if currentDialogIndex < dialogs.count - 1 {
            currentDialogIndex += 1
        } else if currentScene.actions != nil {
            showActions = true
        }
    }
    
    func goToPrev() {
        if showActions {
            showActions = false
        } else if currentDialogIndex > 0 {
            currentDialogIndex -= 1
        } else if let previousScene = sceneHistory.last {
            sceneHistory.removeLast()
            currentSceneIndex = previousScene
            currentDialogIndex = story.scenes[previousScene].dialogs.count - 1
            if story.scenes[previousScene].actions != nil {
                showActions = true
            }
        }
    }
}

/// Character and dialog is coordinate based
/// Should set default position or size for "narator dialog"
/// Each dialog should contain every character involved with it's coordinate, not just the character that do the dialog

#Preview {
    TestView()
}
