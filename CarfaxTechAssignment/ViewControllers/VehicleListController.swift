//
//  VehicleListController.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import UIKit

class VehicleListController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var vehicleTable: UITableView!
    private var listings: [Listing] = []
    private var totalListingCount: Int = 0
    private var imagesDict: [String: UIImage] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func setUpViews() {
        configureTableView()
        configureNavBar()
    }
    
    private func configureTableView() {
        vehicleTable.delegate = self
        vehicleTable.dataSource = self
        vehicleTable.reloadData()
    }
    
    private func configureNavBar() {
        navBar.topItem?.title = "\(totalListingCount) Listings"
        navBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]
        navBar.isTranslucent = false
        navBar.barTintColor = view.backgroundColor
    }
    
    private func getData() {
        DataService.shared.getData() { (data) in
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(Response.self, from: data)
                self.listings.append(contentsOf: json.listings)
                self.totalListingCount = json.totalListingCount
                self.setUpViews()
                for listing in json.listings {
                    imagesDict.updateValue(getImageFromData(stringUrl: listing.images.firstPhoto.medium), forKey: listing.images.firstPhoto.medium)
                    imagesDict.updateValue(getImageFromData(stringUrl: listing.serviceHistory.iconUrl), forKey: listing.serviceHistory.iconUrl)
                    imagesDict.updateValue(getImageFromData(stringUrl: listing.accidentHistory.iconUrl), forKey: listing.accidentHistory.iconUrl)
                    imagesDict.updateValue(getImageFromData(stringUrl: listing.ownerHistory.iconUrl), forKey: listing.ownerHistory.iconUrl)
                    //imagesDict.updateValue(getImageFromData(stringUrl: listing.vehicleUseHistory.iconUrl), forKey: listing.vehicleUseHistory.iconUrl)
                }
                self.vehicleTable.reloadData()
            } catch {
                print( "Can't load data.")
                print(error.localizedDescription)
            }
        } errorHandler: {(error: Error) -> () in
            print(error.localizedDescription)
        }
    }
    
    private func getImageFromData(stringUrl: String) -> UIImage {
        var image = UIImage()
        let data = try? Data(contentsOf: URL(string: stringUrl)!)
        if let imageData = data {
            image = ((UIImage(data: imageData) ?? UIImage(named: "noimage"))!)
        } else {
            image = (UIImage(named: "noimage")!)
        }
        return image
    }
}

extension VehicleListController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VehicleCell

        cell.setData(listingData: listings[indexPath.row], images: imagesDict)
        
        return cell
    }
    
}
