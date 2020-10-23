//
//  LocationMapVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-22.
//

import UIKit
import MapKit

class LocationMapVC : UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        UdacityClient.getStudentLocationList()
        {
            studentLocations, error in
            StudentInformationModel.studentInformationList = studentLocations
            
            self.loadLocationsOnMap()
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.loadLocationsOnMap()
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

extension LocationMapVC : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        
        if annotationView == nil
        {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        }
        
        annotationView?.image = UIImage(named:"icon_pin")
        
        //UIButton rightButton = UIButton(;
        //[rightButton addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
        //customPinView.rightCalloutAccessoryView = rightButton;
        annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        let url:URL?
        
        //MARK: Needs error handling for faulty URLs
        if let subtitle = view.annotation?.subtitle!
        {
            url = URL(string: subtitle)
        }
        else
        {
            return
        }
        
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}


