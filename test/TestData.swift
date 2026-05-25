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
                    dialogs: [
                        DialogModel(name: "Me", text: "WOW! YOUR LUNCH LOOKS YUMMY", character: "1", type: .player),
                        DialogModel(name: "Friend", text: "MY MOM MADE IT THIS MORNING", character: "2", type: .character)
                    ],
                    actions: [
                        ActionModel(text: "CAN I HAVE ONE PIECE?", nextScene: 2),
                        ActionModel(text: "*GRAB FOOD IMMEDIATELY*", nextScene: 3)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 2
                    dialogs: [
                        DialogModel(name: "Friend", text: "SURE! YOU CAN HAVE/TAKE ONE", character: "2", type: .character),
                        DialogModel(name: "Me", text: "THANK YOU", character: "1", type: .player),
                        DialogModel(text: "GOOD JOB ASKING FIRST!", type: .narrator)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 3
                    dialogs: [
                        DialogModel(name: "Friend", text: "OH YOU DIDNT ASK FIRST", character: "2", type: .character)
                    ],
                    actions: [
                        ActionModel(text: "SORRY", nextScene: 4),
                        ActionModel(text: "*IGNORE*", nextScene: 5)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 4
                    dialogs: [
                        DialogModel(name: "Friend", text: "THATS OKEYY, PLEASE ASK NEXT TIME", character: "2", type: .character),
                        DialogModel(text: "FRIENDS SHOULD ASK PERMISSION FIRST", type: .narrator)
                    ],
                    background: "bg-classroom"
                ),
                SceneModel( /// Scene 5
                    dialogs: [
                        DialogModel(text: "FRIEND LOOKS SAD", type: .narrator),
                        DialogModel(text: "FRIENDS SHOULD ASK PERMISSION FIRST", type: .narrator)
                    ],
                    background: "bg-classroom"
                )
            ]
        )
    ]
}

//struct testDate {
//    static let stories: [StoryModel] = [
//        StoryModel(
//            scenes: [
//                SceneModel(
//                    name: "Scene 1",
//                    elements: [
//                        ElementModel(
//                            type: .text,
//                            text: "Hello World",
//                            position: .init(x: 0, y: 0),
//                            size: .init(width: 100, height: 100)
//                        )
//                    ]
//            ]
//        )
//    ]
//}
