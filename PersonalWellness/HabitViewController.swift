//
//  HabitViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit
import Firebase

class HabitViewController: UIViewController {

    @IBOutlet weak var skincareButton:UIButton!
    @IBOutlet weak var sleepButton:UIButton!
    @IBOutlet weak var waterButton:UIButton!
    @IBOutlet weak var workoutButton:UIButton!
    let db = Firestore.firestore()
    var date = ""
    var skincare = false
    var sleep = false
    var water = false
    var workout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " MM.dd.yyyy"
        date = dateFormatter.string(from: Date())
        
        let dateRef = db.collection("users").document("\(date)")
        dateRef.getDocument(completion: { snapshot, error in
            if let err = error {
                print(err.localizedDescription)
            }
            guard let snap = snapshot else { return }
            guard let dict = snap.data() else { return }
            self.skincare = dict["skincare", default: false] as! Bool
            self.sleep = dict["sleep", default: false] as! Bool
            self.water = dict["water", default: false] as! Bool
            self.workout = dict["workout", default: false] as! Bool
                
            if (self.skincare == true) {
                self.skincareButton.backgroundColor = UIColor.lightGray
            } else {
                self.skincareButton.backgroundColor = UIColor.clear
            }
            if (self.sleep == true) {
                self.sleepButton.backgroundColor = UIColor.lightGray
            } else {
                self.sleepButton.backgroundColor = UIColor.clear
            }
            if (self.water == true) {
                self.waterButton.backgroundColor = UIColor.lightGray
            } else {
                self.waterButton.backgroundColor = UIColor.clear
            }
            if (self.workout == true) {
                self.workoutButton.backgroundColor = UIColor.lightGray
            } else {
                self.workoutButton.backgroundColor = UIColor.clear
            }
        })

    }//viewDidLoad
    
    @IBAction func skincareButtonClicked(_ sender: UIButton) {
        if skincareButton.backgroundColor == UIColor.clear {
            skincareButton.backgroundColor = UIColor.lightGray
            skincare = true
        }
        else if skincareButton.backgroundColor == UIColor.lightGray {
            skincareButton.backgroundColor = UIColor.clear
            skincare = false
        }
    }//skincareButtonClicked
    
    
    @IBAction func sleepButtonClicked(_ sender: UIButton) {
        if sleepButton.backgroundColor == UIColor.clear {
            sleepButton.backgroundColor = UIColor.lightGray
            sleep = true
        }
        else if sleepButton.backgroundColor == UIColor.lightGray {
            sleepButton.backgroundColor = UIColor.clear
            sleep = false
        }
    }//sleepButtonClicked
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        if waterButton.backgroundColor == UIColor.clear {
            waterButton.backgroundColor = UIColor.lightGray
            water = true
        }
        else if waterButton.backgroundColor == UIColor.lightGray {
            waterButton.backgroundColor = UIColor.clear
            water = false
        }
    }//waterButtonClicked
    
    @IBAction func workoutButtonClicked(_ sender: Any) {
        if workoutButton.backgroundColor == UIColor.clear {
            workoutButton.backgroundColor = UIColor.lightGray
            workout = true
        }
        else if workoutButton.backgroundColor == UIColor.lightGray {
            workoutButton.backgroundColor = UIColor.clear
            workout = false
        }
    }//workoutButtonClicked
    
    @IBAction func save(_ sender: UIButton) {
        db.collection("users").document("\(date)").setData(["sleep": sleep], merge: true ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
        } // db
    
        db.collection("users").document("\(date)").setData(["water": water], merge: true ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
        } // db
        
        db.collection("users").document("\(date)").setData(["skincare": skincare], merge: true ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
        } // db
        
        db.collection("users").document("\(date)").setData(["workout": workout], merge: true ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
        } // db
        self.dismiss(animated: true, completion: nil)
    } //save
    
}//HabitViewController
