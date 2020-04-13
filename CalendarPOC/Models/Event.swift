//
//  Event.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 4/13/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation

struct Response: Codable, Hashable {
    let events: [Events]
    
    let month: MonthlyData?
}

struct Events: Codable, Hashable {
    
    let name: String
    let date: String
    let isMarkedHoliday: Bool
    let daysToCome: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case date
        case isMarkedHoliday = "is_marked_holiday"
        case daysToCome = "days_to_come"
    }
    
}

struct MonthlyData: Codable, Hashable {
    
    let name: String
    let numberOfDays: Int
    let dayStartsFrom: Int
    let dateToday: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case numberOfDays = "number_of_days"
        case dayStartsFrom = "day_starts_from"
        case dateToday = "date_today"
    }
}
