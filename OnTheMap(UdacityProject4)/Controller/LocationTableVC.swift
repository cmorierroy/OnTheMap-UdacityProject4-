//
//  LocationTableVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-21.
//

import UIKit

class LocationTableVC: OTMViewController
{
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadStudentInformation()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        loadStudentInformation()
    }
    
    func loadStudentInformation()
    {
        UdacityClient.getStudentLocationList()
        {
            studentLocations, error in
            StudentInformationModel.studentInformationList = studentLocations
            self.table.reloadData()
        }
    }
}
