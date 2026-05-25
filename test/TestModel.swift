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

struct CharacterPosition {
    let x: CGFloat
    let y: CGFloat
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
    let characterPosition: CharacterPosition?
    let dialogPosition: CharacterPosition?
    
    init(name: String? = nil, text: String, character: String? = nil, type: DialogType, characterPosition: CharacterPosition? = nil, dialogPosition: CharacterPosition? = nil) {
        self.name = name
        self.text = text
        self.character = character
        self.type = type
        self.characterPosition = characterPosition
        self.dialogPosition = dialogPosition
    }
}

struct ActionModel: Identifiable {
    let id = UUID()
    let text: String
    let nextScene: Int
}
