//
//  ViewModel.swift
//  test
//
//  Created by Calogero Friscia on 25/05/26.
//

import Combine
import UIKit

@MainActor
class ViewModel:ObservableObject {
    
    @Published private(set) var sceneState:SceneState = .onBoarding
    
}

// MARK: Screen Manager
extension ViewModel {
    
    func moveScreenState(to new:SceneState) {
		sceneState = .loading
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			self.sceneState = new
		}
    }
}



// MARK: Programmatically move scene

import SwiftUI
enum SceneState {
    
    case onBoarding
    case storie(_ :StoryModel)
    case miniGame
    case menu
	case loading
	case ending
    
    @ViewBuilder func viewAssociated() -> some View {
        
        switch self {
        case .onBoarding:
            OnboardingView()
        case .menu:
            ChaptersView()
        case .storie(let storie):
            StoryView(story: storie)
        case .miniGame:
            MiniGameMainScene()
		case .loading:
			LoadingKiwiView()
		case .ending:
			EndingView()
        }
        
    }
}
