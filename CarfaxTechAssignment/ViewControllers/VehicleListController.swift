//
//  VehicleListController.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import UIKit

class VehicleListController: UIViewController {

    @IBOutlet weak var vehicleTable: UITableView!
    var listings: [Listing] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicleTable.delegate = self
        vehicleTable.dataSource = self
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


extension VehicleListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VehicleCell
        
        cell.setData(listingData: listings[indexPath.row])
        
        return cell
    }
    
    
}
