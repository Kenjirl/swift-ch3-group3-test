//
//  NewFeatureNotifView.swift
//  test
//
//  Created by Averina on 04/06/26.
//

import SwiftUI

struct NewFeatureNotifView: View {
	@EnvironmentObject var vm:ViewModel
	
	var body: some View {
		Text("To be added")
		StoryNavigationBar(onHome: goToHome)
	}
	
	func goToHome() {
		vm.moveScreenState(to: .menu)
	}
}
