//
//  RunningViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit

class RunningViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //Connect viewController to model
    var controller = RunControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        controller.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //When the viewAppers check to see if any changes to running array
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controller.loadRunning()
    }
    
}


extension RunningViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Data source is the total amount of running sets in array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controller.allRunningSets.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RunningCell") as! RunningTableViewCell
        
        // Since data is optional check to see it is not nil
        guard let theDate = controller.allRunningSets[indexPath.row].date else {
            return cell
        }
        
        //convert seconds to mins and seconds
        let theDuration = controller.allRunningSets[indexPath.row].duration
        let mins = String(format: "%0.f", theDuration / 60)
        let seconds = String (Int(theDuration) % 60)
        let durationText = "Mins: \(mins) Secs: \(seconds)"
        
        
        
        cell.setDate(date: theDate)
        cell.setSpeed(speed: controller.allRunningSets[indexPath.row].speed)
        cell.setDuratation(duration: String(durationText))
        cell.setDistance(theDistance: controller.allRunningSets[indexPath.row].distance)
        
        return cell
    }
    
    //Want the cell to take up a fourth of the tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/4
    }
    
    //if user is swiping to delete, delete a running set
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            controller.persistentContext.delete(controller.allRunningSets[indexPath.row])
            controller.allRunningSets.remove(at: indexPath.row)
            controller.saveContext()
        }
    }
}


extension RunningViewController: runProtocol {
    func updateUI() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func error(error: Error) {
        
        print(error)
    }
}
