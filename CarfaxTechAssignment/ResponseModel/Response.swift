//
//  Response.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Response: Codable {
    let listings: [Listing]
    
    init(listings: [Listing]) {
        self.listings = listings
    }
}
