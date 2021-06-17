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
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        configureTableView()
        configureNavBar()
    }
    
    func configureTableView() {
        vehicleTable.delegate = self
        vehicleTable.dataSource = self
        vehicleTable.separatorColor = .clear
     //   vehicleTable.reloadData()
    }
    
    func configureNavBar() {
        navBar.topItem?.title = "\(totalListingCount) Listings"
        navBar.isTranslucent = false
        navBar.barTintColor = view.backgroundColor
    }
    
    func getData() {
            DispatchQueue.global(qos: .background).async {
                DataService.shared.getData() { (data) in
                    do {
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(Response.self, from: data)
                        DispatchQueue.main.async {
                        self.listings.append(contentsOf: json.listings)
                        print("listings \(self.listings)")
                            self.vehicleTable.reloadData()
                        }
                    } catch {
                        print( "Can't load data.")
                    }
                } errorHandler: {(error: Error) -> () in
                    DispatchQueue.main.async {
                        print(error.localizedDescription)
                    }
                }
            }
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
