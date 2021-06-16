//
//  Dealer.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Dealer: Codable {
    let city: String
    let state: String
    let phone: String
    
    init(city: String, state: String, phone: String) {
        self.city = city
        self.state = state
        self.phone = phone 
    }
}
