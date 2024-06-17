//
//  StepCountsProvider.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsProvider: TimelineProvider {
    
    let pedometerService = PedometerService()
    
    func placeholder(in context: Context) -> StepCountsEntry {
        StepCountsEntry(stepCounts: "3000")
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StepCountsEntry) -> ()) {
        if context.isPreview {
            self.getStepCounts { entry in completion(entry) }            
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<StepCountsEntry>) -> ()) {
        self.getStepCounts { entry in
            
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
    
    private func getStepCounts(completion: @escaping (StepCountsEntry) -> Void) {
        let currentDate = Date()
        let startDate = currentDate.midnight
        
        self.pedometerService.getStepCounts(startDate: startDate, endDate: currentDate) { result in
            switch result {
            case .success(let stepCount):
                completion(StepCountsEntry(stepCounts: String(stepCount), date: currentDate))
            case .failure:
                // TODO: 통신 실패 시, -9 반환
                completion(StepCountsEntry(stepCounts: String(-9), date: currentDate))
                break
            }
        }
    }
    
}
