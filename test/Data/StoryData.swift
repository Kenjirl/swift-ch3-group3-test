//
//  Data.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 21/05/26.
//

import Foundation

struct StoryData {
    static let stories: [StoryModel] = [
        /// Story - 1
        StoryModel(
            scenes: [
                /// --- Part 1 ---
                /// Scene 1
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Andi, what did you bring for lunch?", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Hmm. not sure, let’s check together!", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue")
                    ],
                    background: "bg classroom",
                    nextScene: 2,
                    checkPoint: true
                ),
                
                /// Scene 2
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Wow, your lunch look yummier...", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                    ],
                    actions: [
                        ActionModel(text: "Ask Permission", nextScene: 3),
                        ActionModel(text: "Take the food", nextScene: 4)
                    ],
                    background: "bg classroom"
                ),
                
                /// Scene 3
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Can I have one please?", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Sure, you can take one", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                        DialogModel(name: "Me", text: "Thank you", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                    ],
                    ending: EndingModel(text: "Good Job Asking First!", star: 3, colorName: "accentBlue", background: "bg ending blue", nextScene: 7),
                    background: "bg classroom"
                ),
                
                /// Scene 4
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male shock left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "Oh, you didn’t ask first?", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    actions: [
                        ActionModel(text: "Say sorry", nextScene: 5),
                        ActionModel(text: "Ignore it", nextScene: 6)
                    ],
                    background: "bg classroom"
                ),
                
                /// Scene 5
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "I’m Sorry", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "It’s okay please ask next time", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    ending: EndingModel(text: "Good Friends Respect Boundaries", star: 2, colorName: "accentBlue", background: "bg ending blue", nextScene: 7),
                    background: "bg classroom"
                ),
                
                /// Scene 6
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male shock left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "...", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    ending: EndingModel(text: "Good Friends Respect Boundaries", star: 1, colorName: "accentBlue", background: "bg ending blue", nextScene: 7),
                    background: "bg classroom"
                ),
                
                /// --- Part 2 ---
                /// Scene 7
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Can I have another one?", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Sorry! I want to save it for later.", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    actions: [
                        ActionModel(text: "Okay!", nextScene: 8),
                        ActionModel(text: "Pleaaaasee", nextScene: 9)
                    ],
                    background: "bg classroom",
                    checkPoint: true
                ),
                
                /// Scene 8
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Ok!", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Thank you for understanding!", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                        DialogModel(name: "Me", text: "No problem!", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                    ],
                    ending: EndingModel(text: "Good Friends Respect Boundaries", star: 3, background: "bg ending pink"),
                    background: "bg classroom"
                ),
                
                /// Scene 9
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male shock left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Please... just one more", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "I said no...", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    actions: [
                        ActionModel(text: "Ok, sorry!", nextScene: 10),
                        ActionModel(text: "Ask again", nextScene: 11)
                    ],
                    background: "bg classroom"
                ),
                
                /// Scene 10
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Oh... Ok, sorry friend!", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Thank you for understanding!", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                        DialogModel(name: "Me", text: "No problem!", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                    ],
                    ending: EndingModel(text: "Good Friends Respect Boundaries", star: 3, background: "bg ending pink"),
                    background: "bg classroom"
                ),
                
                /// Scene 11
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male sad left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Please, please, please... just one more", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "I do not like that", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    background: "bg classroom",
                    nextScene: 12
                ),
                
                /// Scene 12
                SceneModel(
                    assets: [
                        AssetModel(source: "char teacher right", type: .npc,
                                   position: AssetPosition(x: 0.12, y: 0.72), size: AssetSize(width: 0.9, height: 1.05), animateAble: false),
                        AssetModel(source: "char female left", type: .player,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Teacher", text: "When someone says no we should stop asking.", type: .npc, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBrown"),
                    ],
                    background: "bg classroom 2",
                    nextScene: 13
                ),
                
                /// Scene 13
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male sad left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Friend", text: "Ya, I don't like that", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    actions: [
                        ActionModel(text: "Sorry, friend!", nextScene: 14),
                        ActionModel(text: "Stay silent.", nextScene: 16)
                    ],
                    background: "bg classroom"
                ),
                
                /// Scene 14
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "Sorry, friend!", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                        DialogModel(name: "Friend", text: "Thank you!", type: .npc, arrowDirection: .right,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBlue"),
                    ],
                    background: "bg classroom",
                    nextScene: 15
                ),
                
                /// Scene 15
                SceneModel(
                    assets: [
                        AssetModel(source: "char teacher right", type: .npc,
                                   position: AssetPosition(x: 0.12, y: 0.72), size: AssetSize(width: 0.9, height: 1.05), animateAble: false),
                        AssetModel(source: "char female left", type: .player,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Teacher", text: "It is important to stop asking when someone says no", type: .npc, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBrown"),
                    ],
                    ending: EndingModel(text: "EVERYONE HAS BOUNDARIES", star: 3, background: "bg ending pink"),
                    background: "bg classroom 2"
                ),
                
                /// Scene 16
                SceneModel(
                    assets: [
                        AssetModel(source: "char female right", type: .player,
                                   position: AssetPosition(x: 0.12, y: 0.825), size: AssetSize(width: 0.65, height: 0.8), animateAble: false),
                        AssetModel(source: "char male sad left", type: .npc,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.15, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.17, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                        AssetModel(source: "prop lunch box pink", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Me", text: "...", type: .player, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentPink"),
                    ],
                    background: "bg classroom",
                    nextScene: 17
                ),
                
                /// Scene 17
                SceneModel(
                    assets: [
                        AssetModel(source: "char teacher right", type: .npc,
                                   position: AssetPosition(x: 0.12, y: 0.72), size: AssetSize(width: 0.9, height: 1.05), animateAble: false),
                        AssetModel(source: "char female left", type: .player,
                                   position: AssetPosition(x: 0.88, y: 0.775), size: AssetSize(width: 0.55, height: 0.75), animateAble: false),
                        AssetModel(source: "table", type: .other,
                                   position: AssetPosition(x: 0.85, y: 0.95), size: AssetSize(width: 0.32, height: 0.45), animateAble: false),
                        AssetModel(source: "prop lunch box blue", type: .other,
                                   position: AssetPosition(x: 0.87, y: 0.88), size: AssetSize(width: 0.12, height: 0.22), animateAble: false),
                    ],
                    dialogs: [
                        DialogModel(name: "Teacher", text: "It is important to stop asking when someone says no", type: .npc, arrowDirection: .left,
                                    position: AssetPosition(x: 0.5, y: 0.55), colorName: "accentBrown"),
                    ],
                    ending: EndingModel(text: "EVERYONE HAS BOUNDARIES", star: 3, background: "bg ending pink"),
                    background: "bg classroom 2"
                ),
            ]
        )
    ]
}
