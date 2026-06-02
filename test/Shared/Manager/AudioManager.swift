//
//  AudioCaller.swift
//  test
//
//  Created by Calogero Friscia on 29/05/26.
//

import AVFoundation

final class AudioManager {
    
    static var shared:AudioManager = AudioManager()
    
    private init() {}
    
    private var player: AVAudioPlayer?
    
    func playAudioEffect(_ audio:AudioAsset) {
        
        let audioResource = audio.getAudioAssetName()
        
        guard let url = Bundle.main.url(forResource: audioResource, withExtension: audio.soundExtension()) else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}

extension AudioManager {
    
    enum AudioAsset {
        
        case puzzleTrash
        case puzzleSnap
        case puzzleNearby
        case puzzleDetach
        
        case mainSound
        
        func getAudioAssetName() -> String {
            
            switch self {
            case .puzzleTrash:
                return "puzzle_trash"
            case .puzzleSnap:
                return "puzzle_snap"
            case .puzzleNearby:
                return "puzzle_nearby"
            case .puzzleDetach:
                return "puzzle_detach"
            case .mainSound:
                return "game_sound"
                
            }
            
            
        }
        
        func soundExtension() -> String {
            
            switch self {
            case .mainSound:
                return "mp3"
            default:
                return "wav"
            }
            
        }
        
    }
    
    
}


