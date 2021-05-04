//
//  RunningTableViewCell.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit

class RunningTableViewCell: UITableViewCell {

    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDate(date: String){
        
        dateLabel.text = date
        
    }
    
    func setDuratation(duration: String) {
        
        durationLabel.text = duration
        
    }
    
    func setSpeed(speed: Float){
        
        let stringSpeed = String(speed)
        speedLabel.text = "Speed: \(stringSpeed)"
        
    }
    
    func setDistance (theDistance: Float){
        distanceLabel.text = String(format: "Distance %.1f", theDistance)
    }

}
