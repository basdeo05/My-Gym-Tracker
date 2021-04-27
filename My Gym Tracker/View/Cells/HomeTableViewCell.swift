//
//  HomeTableViewCell.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var workoutTypeLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifier = "HomeCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    
    
    func setLabel (workoutType: String){
        workoutTypeLabel.text = workoutType
    }
    
    
    
    func setImageView(theImage: UIImage){
        workoutImage.image = theImage
    }
    
    
    
    override func prepareForReuse() {
        workoutTypeLabel.text = "Type of Workout"
        workoutImage.image = nil
    }
    
}
