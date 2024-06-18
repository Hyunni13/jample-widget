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
        StepCountsEntry(stepCounts: "3000", configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (StepCountsEntry) -> ()) {
        if context.isPreview {
            self.getStepCounts(configuration: configuration) { entry in completion(entry) }
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<StepCountsEntry>) -> ()) {
        self.getStepCounts(configuration: configuration) { entry in
            
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
    
    private func getStepCounts(configuration: ConfigurationIntent, completion: @escaping (StepCountsEntry) -> Void) {
        let currentDate = Date()
        let startDate = currentDate.midnight
        
        self.pedometerService.getStepCounts(startDate: startDate, endDate: currentDate) { result in
            switch result {
            case .success(let stepCount):
                completion(StepCountsEntry(stepCounts: String(stepCount), configuration: configuration, date: currentDate))
            case .failure:
                // 통신 실패 시, -9 반환
                completion(StepCountsEntry(stepCounts: String(-9), configuration: configuration, date: currentDate))
                break
            }
        }
    }
    
}
