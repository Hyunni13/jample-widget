//
//  StepCountsWidget.swift
//  CoreJampleWidget
//
//  Created by James on 6/17/24.
//

import SwiftUI
import WidgetKit

struct StepCountsWidget: Widget {
    let kind = "com.core-jample-widget.step-counts"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: self.kind, provider: StepCountsProvider()) { entry in
            if #available(iOS 17.0, *) {
                StepCountsView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else if #available(iOS 15.0, *) {
                StepCountsView(entry: entry)
                    .padding()
                    .background()
            } else {
                StepCountsView(entry: entry)
                    .padding()
            }
        }
        .configurationDisplayName("걸음수 위젯")
        .description("걸음수를 한눈에 살펴보세요.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
