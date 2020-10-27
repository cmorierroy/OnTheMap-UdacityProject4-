//
//  LocationTableExtension.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import Foundation
import UIKit

extension LocationTableVC: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return StudentInformationModel.studentInformationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = table.dequeueReusableCell(withIdentifier: "cell")!
        
        let studentInformation = StudentInformationModel.studentInformationList[indexPath.row]
        
        cell.textLabel?.text = studentInformation.firstName + " " + studentInformation.lastName
        cell.detailTextLabel?.text = studentInformation.mediaURL
        cell.imageView?.image = UIImage(named:"icon_pin")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let url = URL(string: StudentInformationModel.studentInformationList[indexPath.row].mediaURL)
        openURL(url:url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
