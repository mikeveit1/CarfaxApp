//
//  ServiceHistory.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/17/21.
//

import Foundation

struct ServiceHistory: Codable {
    var number: Int
    var iconUrl: String
    var text: String
    
    init(number: Int, iconUrl: String, text: String) {
        self.number = number
        self.iconUrl = iconUrl
        self.text = text
    }
}
