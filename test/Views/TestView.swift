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
    @State private var activeType: DialogType = .player
    @State private var animationTrigger: String = ""
    
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
    
    func isActiveAsset(_ asset: AssetModel) -> Bool {
        if showActions { return asset.type == .player }
        return asset.type.dialogType == currentDialog.type
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Image(currentScene.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Assets — load semua aset scene saat ini
                ForEach(currentScene.assets) { asset in
                    let isActive = isActiveAsset(asset)
                    
                    Image(asset.source)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geometry.size.width * asset.size.width,
                            height: geometry.size.height * asset.size.height
                        )
                        .keyframeAnimator(initialValue: CGFloat(0), trigger: animationTrigger) { view, offset in
                            view.offset(y: isActive ? offset : 0)
                        } keyframes: { _ in
                            CubicKeyframe(0, duration: 0.1)
                            CubicKeyframe(-20, duration: 0.15)
                            CubicKeyframe(0, duration: 0.15)
                            CubicKeyframe(-20, duration: 0.15)
                            CubicKeyframe(0, duration: 0.15)
                        }
                        .position(
                            x: geometry.size.width * asset.position.x,
                            y: geometry.size.height * asset.position.y
                        )
                }
                
                // Dialog bubble
                if let dialogPos = currentDialog.position {
                    HStack(spacing: 0) {
                        if currentDialog.type == .player {
                            RoundedTriangle()
                                .fill(Color.white)
                                .frame(width: 16, height: 16)
                        }
                        
                        Text(currentDialog.text)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .frame(width: geometry.size.width * 0.3)
                            .background(Color.white)
                            .cornerRadius(12)
                            .font(.custom("Fredoka", size: 20))
                        
                        if currentDialog.type == .npc {
                            RoundedTriangle()
                                .fill(Color.white)
                                .frame(width: 16, height: 16)
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    .position(
                        x: geometry.size.width * dialogPos.x,
                        y: geometry.size.height * dialogPos.y
                    )
                }
                
                // Navigasi & Actions di bawah
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            restartScene()
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
                
                // Actions
                if showActions, let actions = currentScene.actions {
                    VStack {
                        Spacer()
                        VStack(spacing: 12) {
                            Text("What will you do?")
                                .bold()
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 8) {
                                ForEach(actions) { action in
                                    Button {
                                        sceneHistory.append(currentSceneIndex)
                                        currentSceneIndex = action.nextScene - 1
                                        currentDialogIndex = 0
                                        withAnimation {
                                            showActions = false
                                        }
                                        DispatchQueue.main.async {
                                            animationTrigger = UUID().uuidString
                                        }
                                    } label: {
                                        Text(action.text)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity)
                                            .padding(10)
                                            .background(Color(red: 255/255, green: 154/255, blue: 134/255))
                                            .foregroundColor(.white)
                                            .cornerRadius(50)
                                            .contentShape(Rectangle())
                                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 4)
                                    }
                                }
                            }
                        }
                        .padding(20)
                        .padding(.bottom, 40)
                        .background(
                            Color.white
                                .cornerRadius(20)
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .bottom))
                    .font(.custom("Fredoka", size: 20))
                }
            }
            .onTapGesture {
                goToNext()
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
        }
        animationTrigger = "\(currentSceneIndex)-\(currentDialog.id)"
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
    TestView()
}
