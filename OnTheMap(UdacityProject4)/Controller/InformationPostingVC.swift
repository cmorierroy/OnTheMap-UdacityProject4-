//
//  InformationPostingVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-26.
//

import UIKit
import MapKit

class InformationPostingVC: OTMViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var findLocButton: UIButton!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var coordinate : CLLocationCoordinate2D? = nil
    var location : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationTextField.layer.cornerRadius = 5
        urlTextField.layer.cornerRadius = 5
        findLocButton.layer.cornerRadius = 5
    }
    
    @IBAction func findLocButtonPressed(_ sender: Any)
    {
        guard let location = locationTextField.text else
        {
            displayAlert(title: "Error", message: "Enter a location!")
            return
        }
        
        guard urlTextField.text != nil else
        {
            displayAlert(title: "Error", message: "Enter a url!")
            return
        }
        
        findLocation(location)
    }
    
    func findingLocation(_ status: Bool)
    {
        if(status)
        {
            activityIndicatorView.startAnimating()
        }
        else
        {
            activityIndicatorView.stopAnimating()
        }
        
        locationTextField.isEnabled = !status
        urlTextField.isEnabled = !status
        findLocButton.isEnabled = !status
    }
    
    func findLocation(_ location: String)
    {
        self.findingLocation(true)
        
        //forward geocode the location
        CLGeocoder().geocodeAddressString(location)
        { (placemark, error) in
            
            guard error == nil else
            {
                self.displayAlert(title: "Error", message: "Location not found: \(location)")
                self.findingLocation(false)
                return
            }
            
            let coordinate = placemark?.first!.location!.coordinate
            
            self.coordinate = coordinate
            self.location = location
            
            self.performSegue(withIdentifier: "foundLocation", sender: nil)
            
            self.findingLocation(false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "foundLocation") {
            
            let informationPostedVC = (segue.destination as! InformationPostedVC)
            
            informationPostedVC.coordinate = coordinate
            informationPostedVC.location = location
            informationPostedVC.studentUrl = urlTextField.text!
        }
    }
}
