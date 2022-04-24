//
//  HabitViewController.swift
//  PersonalWellness
//
//  Created by Victoria Lei on 4/22/22.
//

import UIKit

class HabitViewController: UIViewController {

    @IBOutlet weak var skincareButton:UIButton!
    @IBOutlet weak var sleepButton:UIButton!
    @IBOutlet weak var waterButton:UIButton!
    @IBOutlet weak var workoutButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skincareButton.backgroundColor = UIColor.clear
        sleepButton.backgroundColor = UIColor.clear
        waterButton.backgroundColor = UIColor.clear
        workoutButton.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
    }
    
    @IBAction func skincareButtonClicked(_ sender: UIButton) {
        if skincareButton.backgroundColor == UIColor.clear {
            skincareButton.backgroundColor = UIColor.lightGray
            }
            else if skincareButton.backgroundColor == UIColor.lightGray {
                skincareButton.backgroundColor = UIColor.clear
            }
    }
    
    
    @IBAction func sleepButtonClicked(_ sender: UIButton) {
        if sleepButton.backgroundColor == UIColor.clear {
                sleepButton.backgroundColor = UIColor.lightGray
            }
            else if sleepButton.backgroundColor == UIColor.lightGray {
                sleepButton.backgroundColor = UIColor.clear
            }
    }
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        if waterButton.backgroundColor == UIColor.clear {
                waterButton.backgroundColor = UIColor.lightGray
            }
            else if waterButton.backgroundColor == UIColor.lightGray {
                waterButton.backgroundColor = UIColor.clear
            }
    }
    @IBAction func workoutButtonClicked(_ sender: Any) {
        if workoutButton.backgroundColor == UIColor.clear {
                workoutButton.backgroundColor = UIColor.lightGray
            }
            else if workoutButton.backgroundColor == UIColor.lightGray {
                workoutButton.backgroundColor = UIColor.clear
            }
    }
}
