//
//  gradientColor.swift
//  test
//
//  Created by Calogero Friscia on 29/05/26.
//

import SwiftUI

enum GradientColor {
    
    static var gameBackground = LinearGradient(
        colors: [Color.mainBackgroundTop, Color.mainBackgroundBottom],
        startPoint: .top, endPoint: .bottom)
}
