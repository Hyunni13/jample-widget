//
//  MainViewModel.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import Foundation

class MainViewModel {
    
    let pedometerService = PedometerService()
    
    /**
     걸음수 조회
     */
    func queryStepCounts(completion: @escaping (String) -> Void) {
        let endDate = Date()
        guard let startDate = endDate.midnight else {
            completion(Constants.GUIDE_PEDOMETER_ERROR)
            return
        }
        
        self.pedometerService.requestStepCounts(start: startDate, end: endDate) { result in
            switch result {
            case .success(let stepCounts):
                completion(String(stepCounts))
            case .failure:
                break
            }
        }
    }
    
}
