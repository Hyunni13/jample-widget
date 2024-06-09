//
//  DateExtension.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import Foundation

/**
 시간 조작에 실패하면, 자기 자신 반환
 */
extension Date {
    
    /**
     자정 구하기
     */
    var midnight: Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        return Calendar.current.date(from: components) ?? self
    }
    
}
