//
//  Response.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Response: Codable {
    let listings: [Listing]
    let totalListingCount: Int
    
    init(listings: [Listing], totalListingCount: Int) {
        self.listings = listings
        self.totalListingCount = totalListingCount
    }
}
