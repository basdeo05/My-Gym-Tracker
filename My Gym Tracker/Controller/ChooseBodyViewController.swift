//
//  WorkoutViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 5/3/21.
//

import UIKit

class ChooseBodyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let bodyFocusSections = ["Biceps", "Triceps", "Shoulders", "Chest", "Legs"]
    var chosenIndex: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == Constants.segues.bodyToWorkout){
            
            let destinationVC = segue.destination as! WorkoutViewController
            
            if let index = chosenIndex {
                destinationVC.bodyPartChosen = bodyFocusSections[index]
            }
        }
    }
    
}

extension ChooseBodyViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenIndex = indexPath.row
        performSegue(withIdentifier: Constants.segues.bodyToWorkout, sender: self)
        
        
        
    }
    
    
}
