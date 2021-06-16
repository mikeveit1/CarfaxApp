//
//  Images.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation

struct Images: Codable {
    var firstPhoto: FirstPhoto
    
    init(firstPhoto: FirstPhoto) {
        self.firstPhoto = firstPhoto
    }
}
