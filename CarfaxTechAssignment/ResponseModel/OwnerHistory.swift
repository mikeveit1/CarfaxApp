//
//  OwnerHistory.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/17/21.
//

import Foundation

struct OwnerHistory: Codable {
    var iconUrl: String
    var text: String
    
    init(iconUrl: String, text: String) {
        self.iconUrl = iconUrl
        self.text = text
    }
}
