//
//  StepCountsEntry.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsEntry: TimelineEntry {
    let date: Date
    let stepCounts: String
    
    init(stepCounts: String, date: Date = Date()) {
        self.stepCounts = stepCounts
        self.date = date
    }
}
