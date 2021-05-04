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
        // Do any additional setup after loading the view.
        controller.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controller.loadRunning()
    }
    
}

extension RunningViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controller.allRunningSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RunningCell") as! RunningTableViewCell
        
        guard let theDate = controller.allRunningSets[indexPath.row].date else {
            return cell
        }
        let theDuration = controller.allRunningSets[indexPath.row].duration
        
        cell.setDate(date: theDate)
        cell.setSpeed(speed: controller.allRunningSets[indexPath.row].speed)
        cell.setDuratation(duration: String(theDuration))
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/5
    }
    
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
