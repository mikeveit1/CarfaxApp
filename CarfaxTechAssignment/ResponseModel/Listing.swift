//
//  Listing.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation
struct Listing: Codable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
}
