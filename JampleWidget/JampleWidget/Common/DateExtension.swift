//
//  DateExtension.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import Foundation

extension Date {
    
    /**
     자정
     
     - 2024. 06. 27. 22:54 -> 2024. 06. 27. 00:00
     */
    var midnight: Date? {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        return Calendar.current.date(from: components)
    }
    
}
