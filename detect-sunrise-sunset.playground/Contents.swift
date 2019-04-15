/*
 Compare a time to sunrise and sunset for 12 or 24 hour clock.
*/

import Foundation


let locale = NSLocale.current
let dateFormat = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: locale)!
let timeFormat = DateFormatter()

if dateFormat.range(of: "a") != nil {
    
    // 12 hour clock
    timeFormat.dateFormat = "h:mm a"
    
    let sunrise = timeFormat.date(from: "7:04 am")
    let sunset = timeFormat.date(from: "6:05 pm")
    let now = timeFormat.date(from: "9:00 am")
    
    if now?.compare(sunrise!) == ComparisonResult.orderedDescending
        && now?.compare(sunset!) == ComparisonResult.orderedAscending {
        print("12 hr - day time")
    } else {
        print("12 hr - night time")
    }
    
}
else {
    
    // 24 hour clock
    timeFormat.dateFormat = "HH:mm"
    
    let sunrise = timeFormat.date(from: "7:04")
    let sunset = timeFormat.date(from: "18:05")
    let now = timeFormat.date(from: "14:00")
    
    if now?.compare(sunrise!) == ComparisonResult.orderedDescending
        && now?.compare(sunset!) == ComparisonResult.orderedAscending {
        print("24 hr - day time")
    } else {
        print("24 hr - night time")
    }
    
}
