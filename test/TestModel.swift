//
//  TestModel.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import Foundation

enum DialogType {
    case player
    case character
    case narrator
}

struct StoryModel: Identifiable {
    let id = UUID()
    let scenes: [SceneModel]
}

struct SceneModel: Identifiable {
    let id = UUID()
    let dialogs: [DialogModel]
    var actions: [ActionModel]? = nil
    let background: String
    
    init(dialogs: [DialogModel], actions: [ActionModel]? = nil, background: String) {
        self.dialogs = dialogs
        self.actions = actions
        self.background = background
    }
}

struct DialogModel: Identifiable {
    let id = UUID()
    var name: String? = nil
    let text: String
    var character: String? = nil
    let type: DialogType
    
    init(name: String? = nil, text: String, character: String? = nil, type: DialogType) {
        self.name = name
        self.text = text
        self.character = character
        self.type = type
    }
}

struct ActionModel: Identifiable {
    let id = UUID()
    let text: String
    let nextScene: Int
}
