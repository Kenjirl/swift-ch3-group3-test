//
//  EndingView.swift
//  test
//
//  Created by Averina on 03/06/26.
//

import SwiftUI

struct LessonData: Identifiable {
	let id = UUID()
	let text: String
	let type: String

	static let lesson_1: [LessonData] = [
		LessonData(text: "You can always say:", type: "title"),
		LessonData(text: "No.", type: "text"),
		LessonData(text: "Stop.", type: "text"),
		LessonData(text: "I don't like that.", type: "text"),
	]

	static let lesson_2: [LessonData] = [
		LessonData(
			text: "Is someone making you uncomfortable? Tell:",
			type: "title"
		),
		LessonData(text: "Mom and Dad.", type: "text"),
		LessonData(text: "Teachers.", type: "text"),
	]
}

struct EndingView: View {
	@Environment(\.accessibilityReduceMotion) var reduceMotion
	let lesson: [LessonData]
	var isVisible: Bool

	var body: some View {
		ZStack {
			Image(.endingBG)
				.resizable()
				.ignoresSafeArea()
				.scaledToFill()
			Image(.teacherEnding)
				.position(x: 160, y: 230)

			VStack(alignment: .center, spacing: 12) {
				ForEach(Array(lesson.enumerated()), id: \.element.text) {
					index,
					item in
					Group {
						if item.type == "title" {
							Text(item.text).font(.custom("Fredoka", size: 30))
								.bold()
						} else {
							Text(item.text)
								.font(.custom("Fredoka", size: 30))
						}
					}
					.opacity(isVisible ? 1 : 0)
					.scaleEffect(isVisible ? 1 : 0.8)
					.animation(reduceMotion ? nil :
						.easeOut(duration: 0.5).delay(Double(index) * 0.15),
						value: isVisible
					)
				}
			}
			.foregroundStyle(Color.white)
			.padding()
			.drawingGroup()
			.frame(width: 600, height: 300)
			.position(x: 520, y: 200)

		}

	}

}

struct LessonFlowView: View {
	@EnvironmentObject var vm: ViewModel
	@Environment(\.accessibilityReduceMotion) var reduceMotion

	let lessons: [[LessonData]] = [
		LessonData.lesson_1,
		LessonData.lesson_2,
	]

	@State private var currentIndex = 0
	@State private var isVisible = false

	var body: some View {
		EndingView(lesson: lessons[currentIndex], isVisible: isVisible)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.contentShape(Rectangle())
			.onAppear { isVisible = true }
			.onTapGesture {
				guard currentIndex < lessons.count - 1 else {
					if !reduceMotion {
						withAnimation {
							isVisible = false
						}
					}
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
						goToQuiz()
					}
					return
				}
				if !reduceMotion {
					withAnimation { isVisible = false }
				}
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
					currentIndex += 1
					isVisible = false
					if !reduceMotion {
						withAnimation { isVisible = true }
					}
				}
			}
	}

	func goToQuiz() {
		vm.moveScreenState(to: .quiz)
	}

}

#Preview {
	LessonFlowView().environmentObject(ViewModel())
}
