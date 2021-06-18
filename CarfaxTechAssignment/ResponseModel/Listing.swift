//
//  Listing.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Listing: Codable {
    let images: Images
    let year: Int
    let make: String
    let model: String
    let trim: String
    let currentPrice: Int
    let mileage: Int
    let dealer: Dealer
    let serviceHistory: ServiceHistory
    let accidentHistory: AccidentHistory
    let ownerHistory: OwnerHistory
    
    init(images: Images, year: Int, make: String, model: String, trim: String, currentPrice: Int, mileage: Int, dealer: Dealer, serviceHistory: ServiceHistory, accidentHistory: AccidentHistory, ownerHistory: OwnerHistory) {
        self.images = images
        self.year = year
        self.make = make
        self.model = model
        self.trim = trim
        self.currentPrice = currentPrice
        self.mileage = mileage
        self.dealer = dealer
        self.serviceHistory = serviceHistory
        self.accidentHistory = accidentHistory
        self.ownerHistory = ownerHistory
    }
}
