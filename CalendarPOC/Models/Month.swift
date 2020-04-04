//
//  Month.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/30/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import Foundation

enum Section: Int, CaseIterable {
    case main
}

struct Month: Codable, Hashable {
    
    let name: String
    
    let identifier = UUID()
}
