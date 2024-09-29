//
//  StringExtension.swift
//  UltimezTest
//
//  Created by bhagyaraju on 29/09/24.
//

import Foundation


extension String {
    
    
    func getDataAndTime() -> String {
        // Create a DateFormatter to parse the string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // Set the time zone (if needed)

        // Convert the string into a Date object
        if let date = dateFormatter.date(from: self) {
            
            // Print the epoch time in seconds
            // Initialize a DateFormatter
            let formatter = DateFormatter()

            // Set the desired date and time format
            formatter.dateFormat = "yyyy-MM-dd HH:mm"

            // Convert the Date object to a String
            let dateTimeString = formatter.string(from: date)
            return dateTimeString
        } else {
            print("Failed to parse the date string")
            return ""
        }

    }
}
