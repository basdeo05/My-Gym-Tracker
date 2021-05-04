//
//  ViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Register nib
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
    }
    
    //Dont want navigation bar on home page
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    //everyother page will have navigation bar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Only will have three cell: Running, Weights, & Boxing
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    //Cell 1 = running
    //Cell 2 = Weights
    //Cell 3 = Boxing
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        switch indexPath.row {
        case 0:
            cell.setLabel(workoutType: "Running")
            cell.setImageView(theImage: UIImage(named: "boyRunning")!)
            return cell
        case 1:
            cell.setLabel(workoutType: "Weights")
            cell.setImageView(theImage: UIImage(named: "Weights")!)
            return cell
        case 2:
            cell.setLabel(workoutType: "Boxing")
            cell.setImageView(theImage: UIImage(named: "Boxing")!)
            return cell
        default:
            return cell
        }
    }
    
    //Want the cell to take up one third of the tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
    
    
    //if first cell is chosen go to Running
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row == 0){
            performSegue(withIdentifier: Constants.segues.homeToRun, sender: self)
        }
        else if (indexPath.row == 1){
            performSegue(withIdentifier: Constants.segues.homeToWeights, sender: self)
        }
    }
}

