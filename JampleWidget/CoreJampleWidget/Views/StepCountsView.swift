//
//  StepCountsView.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import SwiftUI

struct StepCountsView: View {
    var entry: StepCountsProvider.Entry
    
    var body: some View {
        VStack {
            Text("👟 Step Counts: \(self.entry.stepCounts)")
        }
    }
}
