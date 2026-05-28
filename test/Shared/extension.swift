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
}

// Subscript sicuro per Array — evita crash su indici fuori range
 extension Array {
    subscript(ifExists index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
