//
//  BackgroundView.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/18/24.
//

import SwiftUI

struct BackgroundView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        colorScheme == .light ? Color(white: 1.0) : Color(red: 43.0 / 255.0, green: 47.0 / 255.0, blue: 54.0 / 255.0)
    }
    
}
