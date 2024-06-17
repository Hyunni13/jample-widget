//
//  MainViewModel.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import Foundation

class MainViewModel {
    
    let pedometerService = PedometerService()
    
    func getStepCounts(completion: @escaping (String) -> Void) {
        let endDate = Date()
        let startDate = endDate.midnight
        
        self.pedometerService.getStepCounts(startDate: startDate, endDate: endDate) { result in
            switch result {
            case .success(let stepCounts):
                completion(String(stepCounts))
            case .failure:
                break
            }
        }
    }
    
}
