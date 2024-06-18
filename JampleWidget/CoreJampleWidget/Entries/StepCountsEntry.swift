//
//  StepCountsEntry.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let stepCounts: String
    
    init(stepCounts: String, configuration: ConfigurationIntent, date: Date = Date()) {
        self.stepCounts = stepCounts
        self.configuration = configuration
        self.date = date
    }
}
