//
//  DateHelper.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import Foundation


// Custom enum for the three different dates we can work with (Yesterday, today, tomorrow)
// Used in the place of hard doded strings
enum DateCategory {
    case yesterday
    case today
    case tomorrow
}


// Extension on date to add previous and next day functionality
extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}


// Date helper class
class DateHelper {
    // Months array used in getDateString
    static var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    
    // Converts a day (today, yesterday or tomorrow) into YYYY-MMM-DD format
    static func getDateString(day:DateCategory) -> String {
        let date:Date
        
        if day == DateCategory.today {
            date = Date()
        } else if day == DateCategory.yesterday {
            date = Date().dayBefore
        } else if day == DateCategory.tomorrow {
            date = Date().dayAfter
        } else {
            return ""
        }
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = months[calendar.component(.month, from: date) - 1]
        let day = calendar.component(.day, from: date)
        
        return "\(year)-\(month)-\(day)"
    }
    
    // Converts an ISO date and time string into time (e.g. 7:00 PM) using dateFormatter
    static func getTimeString(time:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let datetime = dateFormatter.date(from: time)

        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: datetime!)
    }
}
