//
//  StepCountsView.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import SwiftUI
import WidgetKit

struct StepCountsView: View {
    @Environment(\.widgetFamily) var family

    var entry: StepCountsProvider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            VStack {
                Text("👟 Step Counts: \(self.entry.stepCounts)")
            }
        case .systemMedium:
            VStack {
                Text("Hi!")
                Text("👟 Step Counts: \(self.entry.stepCounts)")
            }
        default:
            VStack {
                Text("죄송합니다. 문제가 발생했어요 🥲")
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview(as: .systemSmall) {
    StepCountsWidget()
} timeline: {
    StepCountsEntry(stepCounts: "3000")
}
