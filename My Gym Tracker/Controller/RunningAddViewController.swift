//
//  RunningAddViewController.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/29/21.
//

import UIKit

class RunningAddViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func durationValueChanged(_ sender: UISlider) {
        
        let secondsInt = Int(sender.value)
        let minutes = secondsInt / 60
        
        
        
        
        DispatchQueue.main.async {
            self.minutesLabel.text = "Minutes: \(minutes)"
            
            if (sender.value < 60){
                self.secondsLabel.text = String(format: "Seconds: %.0f" ,sender.value)
            }
            else {
                let temp = Int(sender.value) % 60
                self.secondsLabel.text = "Seconds: \(temp)"
            }
        }
    }
    
    @IBAction func speedValueChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.speedLabel.text = String(format: "%.1f", sender.value)
        }
    }
    
    
    @IBAction func distanceValueChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.distanceLabel.text = "\(String(format: "%.1f", sender.value)) Miles"
        }
    }
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
}
