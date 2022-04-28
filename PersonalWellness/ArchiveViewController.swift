//
//  ArchiveViewController.swift
//  PersonalWellness
//
//  Michelle Yun and Victoria Lei
//

import UIKit
import Firebase

class ArchiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var documentIdArray = [String]()
    var moodArray = [Int]()
    var sleepArray = [Bool]()
    var skincareArray = [Bool]()
    var waterArray = [Bool]()
    var workoutArray = [Bool]()
    var date = ""
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // display date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " MM.dd.yyyy"
        date = dateFormatter.string(from: Date())
        
        getDataFromFirestore()
    } // viewDidLoad
    
    func getDataFromFirestore() {
        let fireStoreDatabase = Firestore.firestore()
        
        fireStoreDatabase.collection("\(username)").addSnapshotListener {(snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if (snapshot != nil && !(snapshot!.isEmpty)) {
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    self.moodArray.removeAll(keepingCapacity: false)
                    self.sleepArray.removeAll(keepingCapacity: false)
                    self.skincareArray.removeAll(keepingCapacity: false)
                    self.workoutArray.removeAll(keepingCapacity: false)
                    self.waterArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents{
                        let documentId = document.documentID
                        self.documentIdArray.append(documentId)
                        
                        if let mood = document.get("mood") as? Int {
                            self.moodArray.append(mood)
                        } else {
                            self.moodArray.append(-1)
                        }
                        if let sleep = document.get("sleep") as? Bool {
                            self.sleepArray.append(sleep)
                        } else {
                            self.sleepArray.append(false)
                        }
                        if let workout = document.get("workout") as? Bool {
                            self.workoutArray.append(workout)
                        } else {
                            self.workoutArray.append(false)
                        }
                        if let water = document.get("water") as? Bool {
                            self.waterArray.append(water)
                        } else {
                            self.waterArray.append(false)
                        }
                        if let skincare = document.get("skincare") as? Bool {
                            self.skincareArray.append(skincare)
                        } else {
                            self.skincareArray.append(false)
                        }
                    } // for
                    self.tableView.reloadData()
                    
                } // if
            } //else
        } // firestore
    } // getDataFromFirestore
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentIdArray.count
        
    } // numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCellTableViewCell
        
        let date = "Date: " + documentIdArray[indexPath.row]
        cell.date.text = date
        
        let mood = moodArray[indexPath.row]
        if (mood==0) {
            cell.mood.image = UIImage(named: "sad")
        } else if (mood==1) {
            cell.mood.image = UIImage(named: "neutral")
            cell.mood.sizeToFit()
        } else if (mood==2) {
            cell.mood.image = UIImage(named: "happy")
            cell.mood.sizeToFit()
        } else if (mood == -1) {
            cell.mood.image = UIImage(named: "empty")
        }
        
        let skincare = skincareArray[indexPath.row]
        let sleep = sleepArray[indexPath.row]
        let water = waterArray[indexPath.row]
        let workout = workoutArray[indexPath.row]
        
        if (skincare==false) {
            cell.skincare.image = UIImage(named: "empty")
        } else {
            cell.skincare.image = UIImage(named: "skincare")
        }
        if (sleep==false) {
            cell.sleep.image = UIImage(named: "empty")
        } else {
            cell.sleep.image = UIImage(named: "sleep")
        }
        if (water==false) {
            cell.water.image = UIImage(named: "empty")
        } else {
            cell.water.image = UIImage(named: "water")
        }
        if (workout==false) {
            cell.workout.image = UIImage(named: "empty")
        } else {
            cell.workout.image = UIImage(named: "workout")
        }
      
        return cell
        
    } // cellForRowAt
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200 //or whatever you need
    } // heightForRowAt

} // ArchiveViewController
