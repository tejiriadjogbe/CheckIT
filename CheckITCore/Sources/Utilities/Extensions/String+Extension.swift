//
//  String+Extension.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//
import UIKit

public extension String {
    
    func formatName() -> String {
        self.replacingOccurrences(of: "/", with: " ").capitalized
    }
    
    func timeAgoSinceDate(_ date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()

        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: now)

        if let years = components.year, years > 0 {
            return "\(years) year\(years == 1 ? "" : "s") ago"
        }

        if let months = components.month, months > 0 {
            return "\(months) month\(months == 1 ? "" : "s") ago"
        }

        if let days = components.day, days > 0 {
            return "\(days) day\(days == 1 ? "" : "s") ago"
        }

        if let hours = components.hour, hours > 0 {
            return "\(hours) hour\(hours == 1 ? "" : "s") ago"
        }

        if let minutes = components.minute, minutes > 0 {
            return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
        }

        if let seconds = components.second, seconds > 0 {
            return "\(seconds) second\(seconds == 1 ? "" : "s") ago"
        }

        return "Just now"
    }

    func convertDateStringToReadableFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = dateFormatter.date(from: self) {
            return timeAgoSinceDate(date)
        } else {
            return nil
        }
    }
}
