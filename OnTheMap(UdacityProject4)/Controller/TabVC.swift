//
//  ViewController.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-19.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func logoutTapped(_ sender: Any)
    {
        UdacityClient.logout(completion: handleLogoutResponse(success:error:))
    }
    
    func handleLogoutResponse(success: Bool, error: Error?)
    {
        if(success)
        {
            print("Successfully logged out.")
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            showLogoutFailure(message: error?.localizedDescription ?? "")
        }
    }
    
    func showLogoutFailure(message:String)
    {
        let alertVC = UIAlertController(title:"Logout failed.",message: message,preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
}

