//
//  LocationTableVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-21.
//

import UIKit

class LocationTableVC: UIViewController
{
        
    @IBOutlet weak var table: UITableView!
    
        var selectedIndex = 0
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            
            UdacityClient.getStudentLocationList() { studentLocations, error in
                StudentInformationModel.studentInformationList = studentLocations
                self.table.reloadData()
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            table.reloadData()
        }
        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//        {
//            if segue.identifier == "showDetail" {
//                let detailVC = segue.destination as! MovieDetailViewController
//                detailVC.movie = MovieModel.watchlist[selectedIndex]
//            }
//        }
        
    }

    extension LocationTableVC: UITableViewDataSource, UITableViewDelegate {
        
        func numberOfSections(in tableView: UITableView) -> Int
        {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return StudentInformationModel.studentInformationList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "cell")!
            
            let studentInformation = StudentInformationModel.studentInformationList[indexPath.row]
            
            cell.textLabel?.text = studentInformation.firstName + " " + studentInformation.lastName
            
            cell.imageView?.image = UIImage(named:"icon_pin")
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            selectedIndex = indexPath.row
            performSegue(withIdentifier: "showDetail", sender: nil)
            table.deselectRow(at: indexPath, animated: true)
        }
        
    }
