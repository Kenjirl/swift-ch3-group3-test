//
//  ContentView.swift
//  test
//
//  Created by Calogero Friscia on 03/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kidsenseVM:ViewModel = ViewModel()
    
    var body: some View {
       
        kidsenseVM
            .sceneState
            .viewAssociated()
            .environmentObject(kidsenseVM)
        
        
    }
}

#Preview {
    ContentView()
}
