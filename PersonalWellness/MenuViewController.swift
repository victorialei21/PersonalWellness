//
//  MenuViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit
import Firebase

class MenuViewController: UIViewController {

    @IBOutlet weak var habitPopUp: UIView!
    @IBOutlet weak var dateText: UITextField!
    var todayDate = Date()
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateText.isUserInteractionEnabled = false
        
        // display date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " MM.dd.yyyy"
        dateText.text = "Today is " +  dateFormatter.string(from: todayDate)

    }//viewDidLoad
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseHabitSegue" {
            let controller = segue.destination as! HabitViewController
            controller.username = self.username
            
        }
        if segue.identifier == "chooseMoodSegue" {
            let controller = segue.destination as! MoodViewController
            controller.username = self.username
        }
    } // prepare

    @IBAction func logout(_ sender: Any) {
        try? Auth.auth().signOut()
        performSegue(withIdentifier: "toLogin", sender: nil)
    }//logout
    
} // MenuViewController

