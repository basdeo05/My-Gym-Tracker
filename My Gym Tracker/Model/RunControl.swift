//
//  RunControl.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 4/27/21.
//

import UIKit
import CoreData

protocol runProtocol {
    func updateUI()
    func error(error: Error)
}

class RunControl {
    
    var delegate: runProtocol?
    
    //Holds all the running workout objects
    var allRunningSets = [Running]()
    
    //persistent containter
    let persistentContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //load running workouts
    func loadRunning (){
        
        //grab all running sets
        //Create a request
        let request : NSFetchRequest<Running> = Running.fetchRequest()
        
        //If was able to get all runnning workouts update the viewController
        do {
            allRunningSets = try persistentContext.fetch(request)
            delegate?.updateUI()
        }
        //else state the error
        catch {
            delegate?.error(error: error)
        }
    }
    
    
    func addRunning (theDate: String, howLong: String, howFast: Float) {
        
        //Give the new object the persistent containter will be saved to
        let newRun = Running(context: persistentContext)
        
        newRun.date = theDate
        newRun.duration = howLong
        newRun.speed = howFast
        allRunningSets.append(newRun)
        
        do {
            try persistentContext.save()
            delegate?.updateUI()
        }
        catch {
            delegate?.error(error: error)
        }
    }
}
