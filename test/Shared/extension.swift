//
//  extension.swift
//  test
//
//  Created by Calogero Friscia on 26/05/26.
//

import SwiftUI

extension Color {
    
    static var mainBackgroundTop:Color {
        Color(red: 218/255, green: 237/255, blue: 246/255)
    }
    
    static var mainBackgroundBottom:Color {
        Color(red: 209/255, green: 240/255, blue: 255/255)
    }
    
    static var itemBackground:Color {
        Color(red: 125/255, green: 162/255, blue: 180/255)
    }
    
    static var loadingDotOn:Color {
      //  Color(red: 216/255, green: 234/255, blue: 76/255)
          Color(red: 150/255, green: 188/255, blue: 0/255)
    }
    
    static var loadingDotOff:Color {
        Color(red: 228/255, green: 228/255, blue: 228/255)
    }
}

// Subscript sicuro per Array — evita crash su indici fuori range
extension Array {
    subscript(ifExists index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

// Raccoglie i frame globali degli slot del vassoio: [item.id: CGRect]
struct SlotFrameKey: PreferenceKey {
    static var defaultValue: [String: CGRect] = [:]
    static func reduce(value: inout [String: CGRect], nextValue: () -> [String: CGRect]) {
        value.merge(nextValue()) { _, new in new }
    }
}
