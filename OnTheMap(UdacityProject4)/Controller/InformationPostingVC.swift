//
//  InformationPostingVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-26.
//

import UIKit
import MapKit

class InformationPostingVC: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var findLocButton: UIButton!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        locationTextField.layer.cornerRadius = 5
        urlTextField.layer.cornerRadius = 5
        findLocButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findLocButtonPressed(_ sender: Any)
    {
        guard let location = locationTextField.text else
        {
            displayAlert(title: "Error", message: "Enter a location!")
            return
        }
        
        guard let url = urlTextField.text else
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
    
    func displayAlert(title: String, message: String)
    {
        func showLoginFailure(message:String)
        {
            let alertVC = UIAlertController(title:title,message: message,preferredStyle: .alert)
            //alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            show(alertVC, sender: nil)
        }
    }
    
    func findLocation(_ location: String)
    {
            self.findingLocation(true)
        
            CLGeocoder().geocodeAddressString(location)
            { (placemark, error) in
                
                guard error == nil else
                {
                    self.displayAlert(title: "Error", message: "Location not found: \(location)")
                    self.findingLocation(false)
                    return
                }
                
                let coordinate = placemark?.first!.location!.coordinate
                
                print(coordinate?.latitude ?? 0)
                print(coordinate?.longitude ?? 0)
                
                self.performSegue(withIdentifier: "foundLocation", sender: (location, coordinate))
                self.findingLocation(false)
            }
    }
    
}
