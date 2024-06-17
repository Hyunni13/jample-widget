//
//  StepCountsProvider.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import WidgetKit

struct StepCountsProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> StepCountsEntry {
        StepCountsEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (StepCountsEntry) -> ()) {
        let entry = StepCountsEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<StepCountsEntry>) -> ()) {
        var entries: [StepCountsEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = StepCountsEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
}
