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
    private var navBarFontSize: CGFloat = 18.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func setUpViews() {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() {
        vehicleTable.delegate = self
        vehicleTable.dataSource = self
        vehicleTable.reloadData()
    }
    
    func configureNavBar() {
        navBar.topItem?.title = "\(totalListingCount) Listings"
        navBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: navBarFontSize)]
        navBar.isTranslucent = false
        navBar.barTintColor = view.backgroundColor
    }
    
    func getData() {
        DataService.shared.getData() { (data) in
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(Response.self, from: data)
                self.listings.append(contentsOf: json.listings)
                self.totalListingCount = json.totalListingCount
                self.setUpViews()
            } catch {
                print( "Can't load data.")
            }
        } errorHandler: {(error: Error) -> () in
            print(error.localizedDescription)
        }
    }
}


extension VehicleListController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VehicleCell
        
        cell.setData(listingData: listings[indexPath.row])
        
        return cell
    }
    
    
}
