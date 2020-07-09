//
//  PhotoViewer.swift
//  PDFAndImageViewer
//
//  Created by Marlon Raskin on 7/7/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import SwiftUI

struct PhotoViewer: View {
	
	var photoName: PageViewData

    var body: some View {

		ZStack {
			Image(photoName.imageNamed)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.pinchToZoom()
		}
		.edgesIgnoringSafeArea(.all)
    }
}

struct PhotoViewer_Previews: PreviewProvider {
    static var previews: some View {
		PhotoViewer(photoName: PageViewData(imageNamed: "Wild-Wild-West"))
    }
}
