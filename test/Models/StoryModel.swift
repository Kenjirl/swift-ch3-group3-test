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
    case other
}

enum DialogArrowDirection {
    case left
    case right
}

extension AssetType {
    var dialogType: DialogType {
        switch self {
            case .player: return .player
            case .npc: return .npc
            case .other: return .other
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
    var ending: EndingModel? = nil
    let background: String
    let nextScene: Int?
    let checkPoint: Bool
    
    init(assets: [AssetModel], dialogs: [DialogModel], actions: [ActionModel]? = nil, ending: EndingModel? = nil, background: String, nextScene: Int? = nil, checkPoint: Bool = false) {
        self.assets = assets
        self.dialogs = dialogs
        self.actions = actions
        self.background = background
        self.ending = ending
        self.nextScene = nextScene
        self.checkPoint = checkPoint
    }
}

struct AssetModel: Identifiable {
    let id = UUID()
    let source: String
    let type: AssetType
    let position: AssetPosition
    let size: AssetSize
    let animateAble: Bool
}

struct DialogModel: Identifiable {
    let id = UUID()
    var name: String? = nil
    let text: String
    let type: DialogType
    let arrowDirection: DialogArrowDirection
    let position: AssetPosition?
    let colorName: String
    
    init(name: String? = nil, text: String, type: DialogType, arrowDirection: DialogArrowDirection, position: AssetPosition? = nil, colorName: String = "accentPink") {
        self.name = name
        self.text = text
        self.type = type
        self.arrowDirection = arrowDirection
        self.position = position
        self.colorName = colorName
    }
}

struct ActionModel: Identifiable {
    let id = UUID()
    let text: String
    let nextScene: Int
}

struct EndingModel: Identifiable {
    let id = UUID()
    let text: String
    let star: Int
    let colorName: String
    let background: String
    let nextScene: Int?
        
    init(text: String, star: Int, colorName: String = "accentPink", background: String, nextScene: Int? = nil) {
        self.text = text
        self.star = star
        self.colorName = colorName
        self.background = background
        self.nextScene = nextScene
    }
}
