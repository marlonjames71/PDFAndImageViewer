//
//  PageIndicatorButton.swift
//  PDFAndImageViewer
//
//  Created by Marlon Raskin on 7/8/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import SwiftUI

struct PageIndicatorButton: View {
    @Binding var isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) { Circle()
            .frame(width: 12, height: 12)
			.foregroundColor(self.isSelected ? Color(.systemGray) : Color(.systemGray4))
        }
    }
}
