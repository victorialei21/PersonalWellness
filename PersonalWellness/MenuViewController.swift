//
//  MenuViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var habitPopUp: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habitPopUp.isHidden = true
        
    }//viewDidLoad
    

    @IBAction func didHabitPopUp(_ sender: UIButton) {
        habitPopUp.isHidden = false
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
