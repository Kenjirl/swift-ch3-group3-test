//
//  Data.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import Foundation

struct TestData {
    static let stories: [StoryModel] = [
        StoryModel(
            scenes: [
                SceneModel( /// Scene 1
                    assets: [
                        AssetModel(source: "1", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "2", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "WOW! YOUR LUNCH LOOKS YUMMY", type: .player, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(name: "Friend", text: "MY MOM MADE IT THIS MORNING", type: .npc, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    actions: [
                        ActionModel(text: "CAN I HAVE ONE PIECE?", nextScene: 2),
                        ActionModel(text: "*GRAB FOOD IMMEDIATELY*", nextScene: 3)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 2
                    assets: [
                        AssetModel(source: "1", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "2", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "SURE! YOU CAN HAVE/TAKE ONE", type: .npc, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(name: "Me", text: "THANK YOU", type: .player, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(text: "GOOD JOB ASKING FIRST!", type: .narrator, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 3
                    assets: [
                        AssetModel(source: "1", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "2", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "OH YOU DIDNT ASK FIRST", type: .npc, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    actions: [
                        ActionModel(text: "SORRY", nextScene: 4),
                        ActionModel(text: "*IGNORE*", nextScene: 5)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 4
                    assets: [
                        AssetModel(source: "1", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "2", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "THATS OKEYY, PLEASE ASK NEXT TIME", type: .npc, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(text: "FRIENDS SHOULD ASK PERMISSION FIRST", type: .narrator, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 5
                    assets: [
                        AssetModel(source: "1", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "2", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45)),
                    ],
                    dialogs: [
                        DialogModel(text: "FRIEND LOOKS SAD", type: .narrator, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(text: "FRIENDS SHOULD ASK PERMISSION FIRST", type: .narrator, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    background: "bg-classroom"
                )
            ]
        )
    ]
}
