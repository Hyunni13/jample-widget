//
//  StepCountsWidget.swift
//  CoreJampleWidget
//
//  Created by James on 6/17/24.
//

import SwiftUI
import WidgetKit

struct StepCountsWidget: Widget {
    
    let kind = Constants.WIDGET_STEP_COUNTS

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: self.kind, intent: ConfigurationIntent.self, provider: StepCountsProvider()) { entry in
            if #available(iOS 17.0, *) {
                StepCountsView(entry: entry)
                    .containerBackground(for: .widget, content: { BackgroundView() })
                    .containerRelativeFrame(.horizontal)
                    .containerRelativeFrame(.vertical)
            } else if #available(iOS 15.0, *) {
                StepCountsView(entry: entry)
                    .background(content: { BackgroundView() })
                    .ignoresSafeArea(edges: .all)
            }
        }
        .configurationDisplayName("걸음수 위젯")
        .description("걸음수를 한눈에 살펴보세요.")
        .supportedFamilies([.systemSmall])
    }
    
}
