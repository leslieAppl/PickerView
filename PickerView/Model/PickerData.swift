//
//  PickerData.swift
//  PickerView
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct PickerData {
    
    var years: [String] = []
    
    init() {
        
        initYears()
        
    }
    
    mutating func initYears() {
        
        for n in 1900...2100 {
            
            let number: String = String(n)
            
            self.years.append(number)
            
        }
        
    }
}

var pickerData = PickerData()

extension Date {
    
    func getDateString() -> String {
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self as Date)
        
        return "\(year)"
        
    }

}
