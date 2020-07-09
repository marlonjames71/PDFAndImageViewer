//
//  PageView.swift
//  PDFAndImageViewer
//
//  Created by Marlon Raskin on 7/8/20.
//  Copyright © 2020 Marlon Raskin. All rights reserved.
//

import SwiftUI

struct PageViewData: Identifiable {
    let id: String = UUID().uuidString
    let imageNamed: String
}
