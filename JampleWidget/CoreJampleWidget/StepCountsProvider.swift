//
//  StepCountsProvider.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsProvider: IntentTimelineProvider {
    
    let pedometerService = PedometerService()
    
    func placeholder(in context: Context) -> StepCountsEntry {
        StepCountsEntry(stepCounts: 3_000, configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (StepCountsEntry) -> ()) {
        if context.isPreview {
            completion(StepCountsEntry(stepCounts: 3_000, configuration: ConfigurationIntent(), isPreview: true))
        } else {
            self.queryStepCounts(configuration: configuration) { stepCounts in
                completion(StepCountsEntry(stepCounts: stepCounts, configuration: configuration))
            }
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<StepCountsEntry>) -> ()) {
        self.queryStepCounts(configuration: configuration) { stepCounts in
            let timeline = Timeline(entries: [StepCountsEntry(stepCounts: stepCounts, configuration: configuration)], policy: .atEnd)
            completion(timeline)
        }
    }
    
    private func queryStepCounts(configuration: ConfigurationIntent, completion: @escaping (Int) -> Void) {
        let currentDate = Date()
        guard let startDate = currentDate.midnight else { return }
        
        self.pedometerService.requestStepCounts(start: startDate, end: currentDate) { result in
            switch result {
            case .success(let stepCounts):
                completion(stepCounts)
            case .failure:
                return
            }
        }
    }
    
}
