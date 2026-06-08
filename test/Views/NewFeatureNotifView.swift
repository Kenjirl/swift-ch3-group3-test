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
		ZStack{
			Text("To be added")
				.bold()
				.font(.custom("Fredoka", size: 50))
				.foregroundStyle(Color.white)
			
			//home button
			VStack {
				HStack {
					Button {
						goToHome()
					} label: {
						Image("btn home")
							.resizable()
							.frame(width: 75, height: 75)
					}
					Spacer()
				}
				.frame(maxWidth: .infinity)
				.padding(.top, 30)
				.padding(.leading, 20)

				Spacer()
			}
		}
		.background(Color(.accentPink).opacity(0.9))
		.frame(width: .infinity, height: .infinity)
		.ignoresSafeArea()
	}
	
	func goToHome() {
		vm.moveScreenState(to: .menu)
	}
}

#Preview {
	NewFeatureNotifView()
}
