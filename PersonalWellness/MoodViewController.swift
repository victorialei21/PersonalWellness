//
//  MoodViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class MoodViewController: UIViewController {

    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sadButton.backgroundColor = UIColor.clear
        neutralButton.backgroundColor = UIColor.clear
        happyButton.backgroundColor = UIColor.clear
        
    }//viewDidLoad
    
    @IBAction func sadbutonClicked(_ sender: UIButton) {
        if sadButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.lightGray
            neutralButton.backgroundColor = UIColor.clear
            happyButton.backgroundColor = UIColor.clear
        } else {
            sadButton.backgroundColor = UIColor.clear
        }
    }//sadbuttonClicked
    
    @IBAction func neutralbutonClicked(_ sender: UIButton) {
        if neutralButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.clear
            neutralButton.backgroundColor = UIColor.lightGray
            happyButton.backgroundColor = UIColor.clear
        } else {
            neutralButton.backgroundColor = UIColor.clear
        }
    }//neutralbuttonClicked
    
    @IBAction func happybuttonClicked(_ sender: UIButton) {
        if happyButton.backgroundColor == UIColor.clear {
            sadButton.backgroundColor = UIColor.clear
            neutralButton.backgroundColor = UIColor.clear
            happyButton.backgroundColor = UIColor.lightGray
        } else {
            happyButton.backgroundColor = UIColor.clear
        }
    }//happyButtonClicked
    
    @IBAction func save(_ sender: UIButton) {
        
    }//save
}//MoodViewController
