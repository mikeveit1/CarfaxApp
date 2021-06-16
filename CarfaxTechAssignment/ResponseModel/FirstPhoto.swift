//
//  FirstPhoto.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct FirstPhoto: Codable {
    var medium: String
    
    init(medium: String) {
        self.medium = medium
    }
}
