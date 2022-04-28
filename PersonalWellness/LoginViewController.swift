//
//  LoginViewController.swift
//  PersonalWellness
//
//  Created by Michelle Yun on 4/27/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    public var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            self.performSegue(withIdentifier: "toMenu", sender: nil)
        }
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        if (emailText.text! != "" && passwordText.text! != "") {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) {(authdata, error) in
                if error != nil {
                    self.makeAlert(titleSent: "Error!", messageSent: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toMenu", sender: nil)
                }
            
            }//{(authdata, error) in
        }//if
        else {
           makeAlert(titleSent: "Error", messageSent: "USer/Password missing")
        }
    } // signUp
        
    
    @IBAction func signIn(_ sender: Any) {
        if (emailText.text! != "" && passwordText.text! != "") {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {

                        self.makeAlert(titleSent: "Error!", messageSent: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toMenu", sender: nil)
                }
            }//{ (authdata, error) in
        }// if (emailText.text
        else {
            makeAlert(titleSent: "Error", messageSent: "USer/Password missing")
        }
    } // signIn
    
    func makeAlert(titleSent : String, messageSent : String) {
        let alert = UIAlertController(title: titleSent, message: messageSent, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }//makeAlert
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMenu" {
            let dashboardController = segue.destination as! UITabBarController
            let menuVC = dashboardController.viewControllers![0] as? MenuViewController
            let archiveVC = dashboardController.viewControllers![1] as? ArchiveViewController
            menuVC?.username = emailText.text!
            archiveVC?.username = emailText.text!
        }
    } // prepare

} // LoginViewController
