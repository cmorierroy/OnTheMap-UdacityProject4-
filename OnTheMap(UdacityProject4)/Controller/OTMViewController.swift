//
//  OTMViewController.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import UIKit

class OTMViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func displayAlert(title: String, message: String)
    {
        let alertVC = UIAlertController(title:title,message: message,preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        showDetailViewController(alertVC, sender: nil)
    }
    
    func openURL(url: URL?)
    {
        if let url = url
        {
            if(UIApplication.shared.canOpenURL(url))
            {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            }
            else
            {
                displayAlert(title: "Error", message: "Invalid URL: \(url)")
            }
        }
        else
        {
            displayAlert(title: "Error", message: "Empty URL.")
            return
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
