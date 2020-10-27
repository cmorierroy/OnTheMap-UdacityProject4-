//
//  LocationMapVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-22.
//

import UIKit
import MapKit

class LocationMapVC : OTMViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        refreshLocations()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        refreshLocations()
    }
    
    func refreshLocations()
    {
        UdacityClient.getStudentLocationList(completion: handleGetStudentInformation(studentLocations:error:))
    }
    
    func handleGetStudentInformation(studentLocations: [StudentInformation], error: Error?)
    {
        if error != nil
        {
            displayAlert(title: "Error", message: error?.localizedDescription ?? "")
        }
        else
        {
            StudentInformationModel.studentInformationList = studentLocations
            self.loadLocationsOnMap()
        }
    }
    
    //Load pins
    func loadLocationsOnMap()
    {
        for studentInfo in StudentInformationModel.studentInformationList
        {
            let studentLocation = CLLocationCoordinate2DMake(studentInfo.latitude, studentInfo.longitude)
            
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = studentLocation
            dropPin.title = studentInfo.firstName + " " + studentInfo.lastName
            dropPin.subtitle = studentInfo.mediaURL
            mapView.addAnnotation(dropPin)
        }
    }
    
}




