//
//  StepCountsView.swift
//  CoreJampleWidgetExtension
//
//  Created by James on 6/17/24.
//

import SwiftUI
import WidgetKit

struct StepCountsView: View {
    
    var entry: StepCountsProvider.Entry
    
    private var emoji: String {
        switch self.entry.configuration.Content {
        case .apple:
            return "🍎"
        case .banana:
            return "🍌"
        default:
            return "🥲"
        }
    }
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading) {
            if self.entry.isPreview == true {
                Text("🍎")
            } else {
                Text(self.emoji)
            }
            
            Spacer()
                .frame(height: 2)
            
            HStack {
                if self.entry.isPreview == true {
                    Text("🍎")
                } else {
                    Text(self.entry.stepCounts.description)
                }
                
                Spacer()
                    .frame(width: 1)
                
                Text("걸음")
            }
        }
    }
}
