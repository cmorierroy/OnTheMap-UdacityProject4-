//
//  LoginVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import UIKit

class LoginVC: UIViewController
{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //round out the login button corners
        loginButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    func setLoggingIn(_ loggingIn: Bool)
    {
         if(loggingIn)
         {
            activityIndicator.startAnimating()
         }
        else
         {
            activityIndicator.stopAnimating()
         }
        
        emailTextField.isEnabled = !loggingIn
        passwordTextField.isEnabled = !loggingIn
        loginButton.isEnabled = !loggingIn
        signUpButton.isEnabled = !loggingIn
    }
    

    @IBAction func signUpTouched(_ sender: Any)
    {
        UIApplication.shared.open(UdacityClient.Endpoints.signUp.url, options: [:], completionHandler: nil)
    }

    @IBAction func loginTouched(_ sender: Any)
    {
        setLoggingIn(true)
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
