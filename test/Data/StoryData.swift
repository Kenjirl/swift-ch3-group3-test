//
//  Data.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import Foundation

struct StoryData {
    static let stories: [StoryModel] = [
        StoryModel(
            scenes: [
                SceneModel( /// Scene 1
                    assets: [
                        AssetModel(source: "Female", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "Male", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "sparkles 3", type: .other, position: AssetPosition(x: 0.2, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: true),
                        AssetModel(source: "lunch-2", type: .other, position: AssetPosition(x: 0.8, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "WOW! YOUR LUNCH LOOKS YUMMY", type: .player, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(name: "Friend", text: "MY MOM MADE IT THIS MORNING", type: .npc, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    actions: [
                        ActionModel(text: "CAN I HAVE ONE PIECE?", nextScene: 2),
                        ActionModel(text: "*GRAB FOOD IMMEDIATELY*", nextScene: 3)
                    ],
                    background: "bgClassroom"
                ),
                SceneModel( /// Scene 2
                    assets: [
                        AssetModel(source: "Female", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "Male", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "sparkles 3", type: .other, position: AssetPosition(x: 0.2, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: true),
                        AssetModel(source: "lunch-2", type: .other, position: AssetPosition(x: 0.8, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "SURE! YOU CAN HAVE/TAKE ONE", type: .npc, position: AssetPosition(x: 0.5, y: 0.55)),
                        DialogModel(name: "Me", text: "THANK YOU", type: .player, position: AssetPosition(x: 0.5, y: 0.55)),
                    ],
                    ending: EndingModel(title: "Title", text: "GOOD JOB ASKING FIRST!", star: 3, colorName: "3E8AEA"),
                    background: "bgClassroom"
                ),
                SceneModel( /// Scene 3
                    assets: [
                        AssetModel(source: "Female", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "Male", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "sparkles 3", type: .other, position: AssetPosition(x: 0.2, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: true),
                        AssetModel(source: "lunch-2", type: .other, position: AssetPosition(x: 0.8, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "OH YOU DIDNT ASK FIRST", type: .npc, position: AssetPosition(x: 0.5, y: 0.55))
                    ],
                    actions: [
                        ActionModel(text: "SORRY", nextScene: 4),
                        ActionModel(text: "*IGNORE*", nextScene: 5)
                    ],
                    background: "bgClassroom"
                ),
                SceneModel( /// Scene 4
                    assets: [
                        AssetModel(source: "Female", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "Male", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "sparkles 3", type: .other, position: AssetPosition(x: 0.2, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: true),
                        AssetModel(source: "lunch-2", type: .other, position: AssetPosition(x: 0.8, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "THATS OKEYY, PLEASE ASK NEXT TIME", type: .npc, position: AssetPosition(x: 0.5, y: 0.55)),
                    ],
                    ending: EndingModel(title: "Title", text: "FRIENDS SHOULD ASK PERMISSION FIRST", star: 2, colorName: "3E8AEA"),
                    background: "bgClassroom"
                ),
                SceneModel( /// Scene 5
                    assets: [
                        AssetModel(source: "Female", type: .player, position: AssetPosition(x: 0.2, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "Male", type: .npc, position: AssetPosition(x: 0.8, y: 0.65), size: AssetSize(width: 0.4, height: 0.65), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.2, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other, position: AssetPosition(x: 0.8, y: 0.95), size: AssetSize(width: 0.38, height: 0.45), animateAble: false),
                        AssetModel(source: "sparkles 3", type: .other, position: AssetPosition(x: 0.2, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: true),
                        AssetModel(source: "lunch-2", type: .other, position: AssetPosition(x: 0.8, y: 0.92), size: AssetSize(width: 0.18, height: 0.25), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(text: "Aw you can't do that", type: .npc, position: AssetPosition(x: 0.5, y: 0.55)),
                    ],
                    ending: EndingModel(title: "Title", text: "FRIENDS SHOULD ASK PERMISSION FIRST", star: 1, colorName: "FF687A"),
                    background: "bgClassroom"
                )
            ]
        )
    ]
}
