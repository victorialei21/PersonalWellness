//
//  MenuViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var habitPopUp: UIView!
    @IBOutlet weak var dateText: UITextField!
    var todayDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateText.isUserInteractionEnabled = false
        
        // display date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " MM/dd/yyyy"
        dateText.text = "Today is " +  dateFormatter.string(from: todayDate)
        
        
    }//viewDidLoad
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
