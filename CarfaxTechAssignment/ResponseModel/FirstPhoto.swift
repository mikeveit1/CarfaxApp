//
//  FirstPhoto.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct FirstPhoto: Codable {
    var large: String
    var medium: String
    var small: String
    
    init(large: String, medium: String, small: String) {
        self.large = large
        self.medium = medium
        self.small = small
    }
}
