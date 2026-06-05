//
//  FacesExpression.swift
//  test
//
//  Created by Lutfi Syahreza Lubis on 04/06/26.
//

import SwiftUI

struct FacesExpression: View {
    let expression: String

    var body: some View {
        Image(expression)
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
}
