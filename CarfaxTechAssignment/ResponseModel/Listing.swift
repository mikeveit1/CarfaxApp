//
//  Listing.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Listing: Codable {
    let id: String
    let images: Images
    let year: Int
    let make: String
    let model: String
    let trim: String
    let currentPrice: Int
    let mileage: Int
    let dealer: Dealer
    
    init(id: String, images: Images, year: Int, make: String, model: String, trim: String, currentPrice: Int, mileage: Int, dealer: Dealer) {
        self.id = id
        self.images = images
        self.year = year
        self.make = make
        self.model = model
        self.trim = trim
        self.currentPrice = currentPrice
        self.mileage = mileage
        self.dealer = dealer
    }
}
