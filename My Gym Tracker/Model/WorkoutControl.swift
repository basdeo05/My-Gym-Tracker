//
//  WorkoutControl.swift
//  My Gym Tracker
//
//  Created by Richard Basdeo on 5/3/21.
//

import UIKit
import CoreData
class WorkoutControl: RunControl {
    
    var allWorkouts = [Workout]()
    
    func loadWorkout(categoryChosen: String){
        
        let request: NSFetchRequest <Workout> = Workout.fetchRequest()
        let predicate = NSPredicate(format: "Workout.categoryName MATCHES %@", categoryChosen)
        request.predicate = predicate
        
        do {
            allWorkouts = try persistentContext.fetch(request)
            delegate?.updateUI()
        }
        catch{
            delegate?.error(error: error)
        }
    }
    
    
    
    func addWorkout(category: String, workoutName: String){
        
        let newWorkout = Workout(context: persistentContext)
        newWorkout.categoryName = category
        newWorkout.workoutName = workoutName
        
        do{
            try persistentContext.save()
            delegate?.updateUI()
        }
        catch {
            delegate?.error(error: error)
        }
    }
    
}
