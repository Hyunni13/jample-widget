//
//  StepCountsEntry.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsEntry: TimelineEntry {
    
    let date = Date()
    let configuration: ConfigurationIntent
    let stepCounts: Int
    
    var isPreview: Bool?
    
    init(stepCounts: Int, configuration: ConfigurationIntent, isPreview: Bool = false) {
        self.configuration = configuration
        self.stepCounts = stepCounts
        self.isPreview = isPreview
    }
    
}
