//
//  RoundedTriangle.swift
//  test
//
//  Created by Benedict Kenjiro Lehot on 26/05/26.
//

import SwiftUI

struct RoundedTriangle: Shape {
    var cornerRadius: CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY - cornerRadius))
        
        path.addArc(tangent1End: topRight, tangent2End: left, radius: 0)
        path.addArc(tangent1End: left, tangent2End: bottomRight, radius: cornerRadius)
        path.addArc(tangent1End: bottomRight, tangent2End: topRight, radius: 0)
        
        path.closeSubpath()
        
        return path
    }
}

struct RoundedTriangle2: Shape {
    var cornerRadius: CGFloat = 4
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY - cornerRadius))
        
        path.addArc(tangent1End: topRight, tangent2End: left, radius: 0)
        path.addArc(tangent1End: left, tangent2End: bottomRight, radius: cornerRadius)
        path.addArc(tangent1End: bottomRight, tangent2End: topRight, radius: 0)
        
        path.closeSubpath()
        
        return path
    }
}
