//
//  TestModel.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import Foundation

enum AssetType {
    case player
    case npc
    case other
}

enum DialogType {
    case player
    case npc
    case narrator
}

extension AssetType {
    var dialogType: DialogType {
        switch self {
            case .player: return .player
            case .npc: return .npc
            case .other: return .narrator
        }
    }
}

struct AssetPosition {
    let x: CGFloat
    let y: CGFloat
}

struct AssetSize {
    let width: CGFloat
    let height: CGFloat
}

struct StoryModel: Identifiable {
    let id = UUID()
    let scenes: [SceneModel]
}

struct SceneModel: Identifiable {
    let id = UUID()
    let assets: [AssetModel]
    let dialogs: [DialogModel]
    var actions: [ActionModel]? = nil
    let background: String
    
    init(assets: [AssetModel], dialogs: [DialogModel], actions: [ActionModel]? = nil, background: String) {
        self.assets = assets
        self.dialogs = dialogs
        self.actions = actions
        self.background = background
    }
}

struct AssetModel: Identifiable {
    let id = UUID()
    let source: String
    let type: AssetType
    let position: AssetPosition
    let size: AssetSize
}

struct DialogModel: Identifiable {
    let id = UUID()
    var name: String? = nil
    let text: String
    let type: DialogType
    let position: AssetPosition?
    
    init(name: String? = nil, text: String, type: DialogType, position: AssetPosition? = nil) {
        self.name = name
        self.text = text
        self.type = type
        self.position = position
    }
}

struct ActionModel: Identifiable {
    let id = UUID()
    let text: String
    let nextScene: Int
}
