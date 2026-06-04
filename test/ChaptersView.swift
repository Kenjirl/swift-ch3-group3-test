//
//  ChaptersView.swift
//  test
//
//  Created by Averina on 02/06/26.
//

import SwiftUI

struct ChaptersView: View {
    @EnvironmentObject var vm:ViewModel
    
	@State private var isZoomed = false
	@State private var scale: Double = 1.1
	@State private var scaleZoom: Double = 1.2
	@State private var lastChapter: Int = 2
	@State private var currentChapter: Int = 1
	@State private var currentAsset: String = "chapter1Asset"
	@State private var isProcessing = false
    
	
	var body: some View {
		NavigationStack {
			ZStack (alignment: .center) {
				Image(.menuBG)
					.resizable()
					.ignoresSafeArea()
					.scaledToFill()
					.scaleEffect(isZoomed ? scaleZoom : scale)
					.animation(.bouncy, value: isZoomed ? scaleZoom : scale)
				
				CloudCartView(h: 65, opacity: 0.3)
					 .offset(x: -90, y: -100)
				CloudCartView(h: 65, opacity: 0.6)
					 .offset(x: 250, y: 0)
				CloudCartView(h: 65, opacity: 0.9)
					 .offset(x: -300, y: 20)
				
				Image("chapter\(currentChapter)Prop")
					.scaleEffect(isZoomed ? scaleZoom : scale)
					.animation(.bouncy, value: isZoomed ? scaleZoom : scale)
					.offset(y:130)
				
				Button {
					isZoomed.toggle()
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
						isZoomed = false
						}
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
						isProcessing = true

						}
				} label: {
					Image(currentAsset)
						.resizable()
						.scaledToFit()
						.frame(width: 330)
						.scaleEffect(isZoomed ? scaleZoom : scale)
						.animation(.bouncy, value: isZoomed ? scaleZoom : scale)
				}
				.offset(y: 50)
				.navigationDestination(isPresented: $isProcessing) {
					if currentChapter == 1 {
						StoryView(story: StoryData.storie_1)
					} else {
						Text("To be added")
					}
                    
				}
				//.disabled(isProcessing)
				
				
				VStack {
					Text("Chapter \(currentChapter)")
						.font(.title2)
					Text(currentChapter == 2 ? "Holiday at the Farm" : "Lunch in The School")
						.font(.title)
						.bold()
				}
				.frame(width: 300, height: 300, alignment: .top)
				.foregroundStyle(Color.white)
				
				
				// Navigasi
				HStack {
					if currentChapter != 1 {
						Button {
							goToPrev()
						} label: {
							Image(.prev)
						}
					}
					
					Spacer()
					
					if currentChapter != lastChapter {
						Button {
							goToNext()
						} label: {
							Image(.next)
						}
					}
				}
				.padding(20)
				.offset(x: -20, y: 20)
			}
		}
	}
	
	func goToNext() {
		currentChapter += 1
		currentAsset = "chapter\(currentChapter)Asset"
	}
	
	func goToPrev() {
		currentChapter -= 1
		currentAsset = "chapter\(currentChapter)Asset"
	}
}


#Preview {
	ChaptersView()
}
