//
//  DataService.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import Foundation
class DataService {
    static let shared = DataService()
    
    public func getData(completion: (Data) -> Void, errorHandler: (Error) -> Void) {
        guard let url =  URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json") else { return }
        do {
            let data = try Data(contentsOf: url)
            completion(data)
        } catch {
            errorHandler(error)
        }
    }
}
