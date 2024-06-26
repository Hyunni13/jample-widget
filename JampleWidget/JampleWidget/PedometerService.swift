//
//  PedometerService.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import CoreMotion

class PedometerService {
    
    let pedometer = CMPedometer()
    
    /**
     걸음수 요청
     */
    func requestStepCounts(start: Date, end: Date, completion: @escaping (Result<Int, APIError>) -> Void) {
        self.pedometer.queryPedometerData(from: start, to: end) { data, error in
            if let error = error {
                print(error.localizedDescription)
                
                completion(.failure(.pedometerError))
                return
            }
            
            if let data = data {
                // 정상 케이스
                let stepCounts = Int(round(data.numberOfSteps.doubleValue))
                completion(.success(stepCounts))
            } else {
                completion(.failure(.responseError))
            }
        }
    }
    
}
