//
//  InformationPostedVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import UIKit
import MapKit

class InformationPostedVC: OTMViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var submitButton: UIButton!
    
    var coordinate : CLLocationCoordinate2D? = nil
    var location : String = ""
    var studentInformation : StudentInformation? = nil
    var studentUrl : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //create pin
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = coordinate!
        dropPin.title = "\(String(describing:UserData.user?.firstName ?? "")) \(String(describing:UserData.user?.lastName ?? ""))"
        dropPin.subtitle  = studentUrl
        mapView.addAnnotation(dropPin)
        
        let region = MKCoordinateRegion(center: dropPin.coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
        
        mapView.setRegion(region, animated: true)
    }
    
    func submitted(_ toggled:Bool)
    {
        submitButton.isEnabled = !toggled
    }
    
    @IBAction func submitTapped(_ sender: Any)
    {
        submitted(true)
        
        if let latitude = coordinate?.latitude
        {
            if let longitude = coordinate?.longitude
            {
                UdacityClient.postLocation(mapString: location, mediaURL: studentUrl, latitude: latitude, longitude: longitude, completion: handlePostLocation(success:error:))
            }
        }
    }
    
    func handlePostLocation(success:Bool, error: Error?)
    {
        if(success)
        {
            submitted(false)
            self.dismiss(animated: false, completion: nil)
            
            //segue back to updated map view.
            self.performSegue(withIdentifier: "locationPosted", sender: nil)
        }
        else
        {
            displayAlert(title: "Error" , message: error?.localizedDescription ?? "")
            submitted(false)
        }
        
    }
}
