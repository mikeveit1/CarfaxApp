//
//  ErrorAlert.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/17/21.
//

import Foundation
import UIKit

extension UIViewController {
    public func showErrorAlert(title: String, message:String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { action in
                                            self.dismiss(animated: true, completion: nil) })
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
