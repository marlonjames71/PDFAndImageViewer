//
//  SwiperView.swift
//  PDFAndImageViewer
//
//  Created by Marlon Raskin on 7/8/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import SwiftUI

struct SwiperView: View {
    let pages: [PageViewData]

	@Environment(\.presentationMode) var presentationMode

    @Binding var index: Int
    @State private var offset: CGFloat = 0
    @State private var isUserSwiping: Bool = false

    var body: some View {
        GeometryReader { geometry in
			ZStack(alignment: .bottom) {
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(alignment: .center, spacing: 0) {
						ForEach(self.pages) { viewData in
							PhotoViewer(photoName: viewData)
								.frame(width: geometry.size.width,
									   height: geometry.size.height)
						}
					}
				}
				.content
				.offset(x: self.isUserSwiping ? self.offset : CGFloat(self.index) * -geometry.size.width)
				.frame(width: geometry.size.width, alignment: .leading)
				.gesture(
					DragGesture()
						.onChanged({ value in
							self.isUserSwiping = true
							self.offset = value.translation.width + -geometry.size.width * CGFloat(self.index)
						})
						.onEnded({ value in
							if value.predictedEndTranslation.width < geometry.size.width / 2, self.index < self.pages.count - 1 {
								self.index += 1
							}
							if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
								self.index -= 1
							}
							withAnimation {
								self.isUserSwiping = false
							}
						})
				)

				VStack {
					Image(systemName: "chevron.compact.down")
						.foregroundColor(Color(.systemGray2))
						.font(.largeTitle)
						.padding(.top, 16)
						.onTapGesture {
							self.presentationMode.wrappedValue.dismiss()
					}

					Spacer()

					HStack(spacing: 8) {
						ForEach(0..<self.pages.count) { index in
							PageIndicatorButton(isSelected: Binding<Bool>(get: { self.index == index }, set: { _ in })) {
								withAnimation {
									self.index = index
								}
							}
						}
					}
					.padding(.bottom, 12)
				}
			}
        }
    }
}
