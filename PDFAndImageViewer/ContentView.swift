//
//  ContentView.swift
//  PDFAndImageViewer
//
//  Created by Marlon Raskin on 7/7/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var imageViewerPresented: Bool = false
	@State private var photoPickerPresented: Bool = false

	let photos: [PageViewData] = [
		PageViewData(imageNamed: "Wild-Wild-West"),
		PageViewData(imageNamed: "Concert"),
		PageViewData(imageNamed: "Drive"),
	]

	@State private var index: Int = 0

	var body: some View {
		ZStack {
			VStack {
				Spacer()

				Image(photos[index].imageNamed)
					.resizable()
					.frame(width: 320, height: 250)
					.aspectRatio(contentMode: .fill)
					.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
					.onTapGesture {
						self.imageViewerPresented.toggle()
				}
				.sheet(isPresented: self.$imageViewerPresented) {
					SwiperView(pages: self.photos, index: self.$index)
				}
				.padding(.bottom, 40)

				Divider()

				Spacer()

				HStack(spacing: 16) {
					SelectPhotoButton(action: {
						self.index = 0
					}, title: "Wild West")

					SelectPhotoButton(action: {
						self.index = 1
					}, title: "Concert")

					SelectPhotoButton(action: {
						self.index = 2
					}, title: "Road Trip")
				}

				Spacer()
			}
		}
		.background(Color(.systemBackground))
		.edgesIgnoringSafeArea(.all)
	}
}


struct SelectPhotoButton: View {
	let action: () -> Void
	var title: String

	var body: some View {
		Button(action: {
			self.action()
		}) {
			Text(title)
				.foregroundColor(Color(.systemTeal))
		}
		.padding(.all, 10)
		.background(Color(.systemIndigo))
		.clipShape(Capsule())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice(PreviewDevice(stringLiteral: "iPhone 11 Pro"))
			.colorScheme(.dark)
	}
}
