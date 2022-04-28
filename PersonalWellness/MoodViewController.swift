//
//  MoodViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit
import Firebase

class MoodViewController: UIViewController {

    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    var buttonClicked = -1
    let db = Firestore.firestore()
    var date = ""
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sadButton.backgroundColor = UIColor.clear
        neutralButton.backgroundColor = UIColor.clear
        happyButton.backgroundColor = UIColor.clear
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " MM.dd.yyyy"
        date = dateFormatter.string(from: Date())
        
        let dateRef = db.collection("\(username)").document("\(date)")
        dateRef.getDocument(completion: { snapshot, error in
            if let err = error {
                print(err.localizedDescription)
            }
            guard let snap = snapshot else { return }
            guard let dict = snap.data() else { return }
            self.buttonClicked = dict["mood", default: -1] as! Int
        
            if (self.buttonClicked == 0) {
                self.sadButton.backgroundColor = UIColor.lightGray
            }
            else if (self.buttonClicked == 1) {
                self.neutralButton.backgroundColor = UIColor.lightGray
            }
            else if (self.buttonClicked == 2) {
                self.happyButton.backgroundColor = UIColor.lightGray
            }
        })
        
    }//viewDidLoad
    
    @IBAction func sadbuttonClicked(_ sender: UIButton) {
        if sadButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.lightGray
            neutralButton.backgroundColor = UIColor.clear
            happyButton.backgroundColor = UIColor.clear
            buttonClicked = 0
        } else {
            sadButton.backgroundColor = UIColor.clear
            buttonClicked = -1
        }
    }//sadbuttonClicked
    
    @IBAction func neutralbuttonClicked(_ sender: UIButton) {
        if neutralButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.clear
            neutralButton.backgroundColor = UIColor.lightGray
            happyButton.backgroundColor = UIColor.clear
            buttonClicked = 1
        } else {
            neutralButton.backgroundColor = UIColor.clear
            buttonClicked = -1
        }
    }//neutralbuttonClicked
    
    @IBAction func happybuttonClicked(_ sender: UIButton) {
        if happyButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.clear
            neutralButton.backgroundColor = UIColor.clear
            happyButton.backgroundColor = UIColor.lightGray
            buttonClicked = 2
        } else {
            happyButton.backgroundColor = UIColor.clear
            buttonClicked = -1
        }
    }//happyButtonClicked
    
    @IBAction func save(_ sender: UIButton) {
        db.collection("\(username)").document("\(date)").setData(["mood": buttonClicked ], merge: true ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        } // db
        
    } //save
    
}//MoodViewController
