//
//  RunningViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit

class RunningViewController: UIViewController {

    //Connect viewController to model
    var controller = RunControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controller.delegate = self
        
        //Load all of users's running workouts saved
        controller.loadRunning()
    }
}

extension RunningViewController: runProtocol {
    func updateUI() {
    }
    
    func error(error: Error) {
    }
}
