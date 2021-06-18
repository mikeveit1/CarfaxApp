//
//  VehicleCell.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet weak var listingStackView: UIStackView!
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var vehicleInfoStackView: UIStackView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var dealerPhoneButton: UIButton!
    @IBOutlet weak var highlightStackView: UIStackView!
    @IBOutlet weak var accidentStackView: UIStackView!
    @IBOutlet weak var personalUseStackView: UIStackView!
    @IBOutlet weak var oneOwnerStackView: UIStackView!
    @IBOutlet weak var serviceHistoryStackView: UIStackView!
    @IBOutlet weak var accidentImageView: UIImageView!
    @IBOutlet weak var accidentLabel: UILabel!
    @IBOutlet weak var personalImageView: UIImageView!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var oneOwnerImageView: UIImageView!
    @IBOutlet weak var oneOwnerLabel: UILabel!
    @IBOutlet weak var serviceHistoryImageView: UIImageView!
    @IBOutlet weak var serviceHistoryLabel: UILabel!
    private var dealerPhoneNumber: String = ""
    private var titleFontSize: CGFloat = 18.0
    private var infoFontSize: CGFloat = 17.0
    private var phoneFontSize: CGFloat = 16.0
    private var highlightSize: CGFloat = 15.0
    
    
    
    func setData(listingData: Listing, images: [String: UIImage]) {
        vehicleImage.image = images[listingData.images.firstPhoto.medium]
        let vehicleTitle = "\(listingData.year) \(listingData.make) \(listingData.model)"
        
        title.text = vehicleTitle
        
        price.text = "\(formatPrice(value: listingData.currentPrice))"
        
        let vehicleMileage = Double(listingData.mileage / 1000).rounded()
        mileage.text = "| \(formatMileage(value: vehicleMileage))k Mi |"
        
        let vehicleLocation = "\(listingData.dealer.city), \(listingData.dealer.state)"
        location.text = vehicleLocation
        
        accidentLabel.text = listingData.accidentHistory.text
        accidentImageView.image = images[listingData.accidentHistory.iconUrl]
        
        var serviceRecordSuffix = String()
        if listingData.serviceHistory.number == 1 {
            serviceRecordSuffix = "Record"
        } else {
            serviceRecordSuffix = "Records"
        }
        serviceHistoryLabel.text = "\(listingData.serviceHistory.number) \(listingData.serviceHistory.text) \(serviceRecordSuffix)"
        serviceHistoryImageView.image = images[listingData.serviceHistory.iconUrl]
        
        dealerPhoneNumber = listingData.dealer.phone
        dealerPhoneButton.setTitle(formatPhoneNumber(phoneNumber: dealerPhoneNumber), for: .normal)
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
          vehicleImage.image = nil
       }
    
    func setUpViews() {
        vehicleImage.layer.masksToBounds = true
        vehicleImage.layer.cornerRadius = 20
        
        title.font = UIFont.boldSystemFont(ofSize: titleFontSize)
        
        price.font = UIFont.boldSystemFont(ofSize: infoFontSize)
        
        mileage.font = UIFont.systemFont(ofSize: infoFontSize)
        
        location.font = UIFont.systemFont(ofSize: infoFontSize)
        
        accidentLabel.font = UIFont.systemFont(ofSize: highlightSize)
        personalLabel.font = UIFont.systemFont(ofSize: highlightSize)
        
        oneOwnerLabel.font = UIFont.systemFont(ofSize: highlightSize)
        
        serviceHistoryLabel.font = UIFont.systemFont(ofSize: highlightSize)
        
        dealerPhoneButton.titleLabel?.font = UIFont.systemFont(ofSize: phoneFontSize)
        
    }
    
    @IBAction func dealerPhoneButtonPressed(_ sender: Any) {
        if let url = URL(string: "tel://\(dealerPhoneNumber)") {
            UIApplication.shared.open(url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
}
