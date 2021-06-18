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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var vehicleInfoStackView: UIStackView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dealerPhoneButton: UIButton!
    @IBOutlet weak var highlightStackView: UIStackView!
    @IBOutlet weak var accidentStackView: UIStackView!
    @IBOutlet weak var ownerHistoryStackView: UIStackView!
    @IBOutlet weak var serviceHistoryStackView: UIStackView!
    @IBOutlet weak var accidentImageView: UIImageView!
    @IBOutlet weak var accidentLabel: UILabel!
    @IBOutlet weak var ownerHistoryImageView: UIImageView!
    @IBOutlet weak var ownerHistoryLabel: UILabel!
    @IBOutlet weak var serviceHistoryImageView: UIImageView!
    @IBOutlet weak var serviceHistoryLabel: UILabel!
    private var dealerPhoneNumber: String = ""
    private var titleFontSize: CGFloat = 18.0
    private var infoFontSize: CGFloat = 17.0
    private var phoneFontSize: CGFloat = 16.0
    private var highlightSize: CGFloat = 15.0
    private var labelColor: UIColor = .white
    
    public func setData(listingData: Listing, images: [String: UIImage]) {
        vehicleImage.image = images[listingData.images.firstPhoto.medium]
        
        let vehicleTitle = "\(listingData.year) \(listingData.make) \(listingData.model) \(listingData.trim)"
        titleLabel.text = vehicleTitle
        
        priceLabel.text = "\(formatPrice(value: listingData.currentPrice))"
        
        let vehicleMileage = Double(listingData.mileage / 1000).rounded()
        mileageLabel.text = "| \(formatMileage(value: vehicleMileage))k Mi |"
        let vehicleLocation = "\(listingData.dealer.city), \(listingData.dealer.state)"
        locationLabel.text = vehicleLocation
        
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
        
        ownerHistoryLabel.text = "\(listingData.ownerHistory.text)"
        ownerHistoryImageView.image = images[listingData.ownerHistory.iconUrl]
        
        dealerPhoneNumber = listingData.dealer.phone
        dealerPhoneButton.setTitle(formatPhoneNumber(phoneNumber: dealerPhoneNumber), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        vehicleImage.image = nil
    }
    
    private func setUpViews() {
        self.backgroundColor = .black
        
        vehicleImage.layer.masksToBounds = true
        vehicleImage.layer.cornerRadius = 20
        
        titleLabel.textColor = labelColor
        priceLabel.textColor = labelColor
        mileageLabel.textColor = labelColor
        locationLabel.textColor = labelColor
        accidentLabel.textColor = labelColor
        serviceHistoryLabel.textColor = labelColor
        ownerHistoryLabel.textColor = labelColor
        dealerPhoneButton.tintColor = .systemBlue
        
        configureFont(label: titleLabel, bold: true, size: titleFontSize)
        configureFont(label: priceLabel, bold: true, size: infoFontSize)
        configureFont(label: mileageLabel, bold: false, size: infoFontSize)
        configureFont(label: locationLabel, bold: false, size: infoFontSize)
        configureFont(label: accidentLabel, bold: false, size: highlightSize)
        configureFont(label: ownerHistoryLabel, bold: false, size: highlightSize)
        configureFont(label: serviceHistoryLabel, bold: false, size: highlightSize)
        configureFont(label: dealerPhoneButton.titleLabel!, bold: true, size: phoneFontSize)
    }
    
    private func configureFont(label: UILabel, bold: Bool, size: CGFloat) {
        if bold {
            label.font = UIFont.boldSystemFont(ofSize: size)
        } else {
            label.font = UIFont.systemFont(ofSize: size)
        }
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
