//
//  PedometerService.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import CoreMotion

class PedometerService {
    
    let pedometer = CMPedometer()
    
    func getStepCounts(startDate: Date, endDate: Date, completion: @escaping (Result<Double, APIError>) -> Void) {
        self.pedometer.queryPedometerData(from: startDate, to: endDate) { data, error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(.failure(.pedometerError))
                return
            }
            
            if let data = data {
                // 정상 케이스
                let stepCounts = data.numberOfSteps.doubleValue
                completion(.success(stepCounts))
            } else {
                completion(.failure(.responseError))
            }
        }
    }
    
}
