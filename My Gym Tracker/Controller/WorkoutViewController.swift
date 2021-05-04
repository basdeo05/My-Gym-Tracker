//
//  WorkoutViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 5/3/21.
//

import UIKit

class WorkoutViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let bodyFocusSections = ["Biceps", "Triceps", "Shoulders", "Chest", "Legs"]
    

    let workoutControl = WorkoutControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
}

extension WorkoutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodyFocusSections.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
            cell.setImageView(theImage: UIImage(named: "biceps")!)
        case 1:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
            cell.setImageView(theImage: UIImage(named: "triceps")!)
        case 2:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
            cell.setImageView(theImage: UIImage(named: "shoulders")!)
        case 3:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
            cell.setImageView(theImage: UIImage(named: "chest")!)
        case 4:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
            cell.setImageView(theImage: UIImage(named: "legs")!)
        default:
            cell.setLabel(workoutType: bodyFocusSections[indexPath.row])
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    
}
