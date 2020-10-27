//
//  LoginVC.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import UIKit

class LoginVC: OTMViewController
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
    
    func handleLoginResponse(success: Bool, error: Error?)
    {
        if(success)
        {            
            UdacityClient.getUserInformation(completion: handleUserInfoResponse(success:error:))
        }
        else
        {
            setLoggingIn(false)
            displayAlert(title: "Login Failed.", message: error?.localizedDescription ?? "")
            //showLoginFailure(message: error?.localizedDescription ?? "")
        }
    }
    
    func handleUserInfoResponse(success:Bool, error: Error?)
    {
        if(success)
        {
            //segue to next view controller
            setLoggingIn(false)
            self.dismiss(animated: false, completion: nil)
            self.performSegue(withIdentifier: "completeLogin", sender: nil)
        }
        else
        {
            setLoggingIn(false)
            displayAlert(title: "Login Failed.", message: error?.localizedDescription ?? "")
        }
    }

    @IBAction func signUpTouched(_ sender: Any)
    {
        openURL(url: UdacityClient.Endpoints.signUp.url)
    }

    @IBAction func loginTouched(_ sender: Any)
    {
        setLoggingIn(true)
        UdacityClient.login(username: emailTextField.text ?? "", password: passwordTextField.text ?? "", completion: handleLoginResponse(success:error:))
    }
}
