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
    
    var body: some View {
        ZStack {
            // Background
            Image(currentScene.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Content
            VStack {
                Spacer()
                
                VStack(spacing: 0) {
                    // Character
                    HStack {
                        if showActions {
                            if let character = playerCharacter {
                                Image(character)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 100)
                                    .offset(y: 40)
                                    .clipped()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        } else if currentDialog.type != .narrator {
                            Image(currentDialog.character ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 100)
                                .offset(y: 40)
                                .clipped()
                                .frame(maxWidth: .infinity, alignment: currentDialog.type == .player ? .leading : .trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(
                        LinearGradient(
                            colors: [.clear, .white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
                    // Actions / Dialogs
                    if showActions, let actions = currentScene.actions {
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
                                .border(Color.blue, width: 1)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                        .padding(10)
                        .border(Color.gray, width: 1)
                        .background(Color.white.ignoresSafeArea())
                    } else {
                        VStack {
                            if let name = currentDialog.name {
                                Text(name)
                                    .frame(maxWidth: .infinity, alignment: currentDialog.type == .player ? .leading : .trailing)
                                    .bold()
                            }
                            
                            Text(currentDialog.text)
                                .frame(maxWidth: .infinity, alignment: currentDialog.type == .narrator ? .center : currentDialog.type == .player ? .leading : .trailing)
                            
                            if currentDialog.type != .narrator {
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                        .padding(10)
                        .border(Color.gray, width: 1)
                        .background(Color.white.ignoresSafeArea())
                    }
                    
                    // Navigasi
                    HStack {
                        if !isFirstDialog {
                            Button("Prev") {
                                goToPrev()
                            }
                            .padding(10)
                        }
                        
                        Spacer()
                        
                        if !showActions && !isLastDialog {
                            Button("Next") {
                                goToNext()
                            }
                            .padding(10)
                        }
                    }
                    .background(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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

#Preview {
    TestView()
}
