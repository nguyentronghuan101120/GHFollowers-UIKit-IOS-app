//
//  StringExt.swift
//  GHFollowers
//
//  Created by Huân Nguyễn on 8/4/24.
//

import Foundation


extension String{
    func convertISOStringDateToMonthAndYear() -> Date? {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        dateFormatter.locale = Locale(identifier: "vi_VN")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
        
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertISOStringDateToMonthAndYear()     else
        {
            return "N/A" }
        return date.convertToMonthYearFormat()
    }
    
}
