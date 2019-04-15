/*
 Determine if device is using a 12 or 24 hour clock.
 See question posted on Stack Overflow at:
 https://stackoverflow.com/questions/28162729/nsdateformatter-detect-24-hour-clock-in-os-x-and-ios
*/

import Foundation

let formatString = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current)!
let hasAMPM = formatString.contains("a")

if hasAMPM {
    print("12-hour clock")
} else {
    print("24-hour clock")
}
