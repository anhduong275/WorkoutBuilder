//
//  DataStore.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/24/23.
//

import Foundation

class DataStore {
    // singleton
    static let sharedDataStore = DataStore()
    private init() {}
    
    var exerciseIDDict : [UUID: Exercise] = [:]
    
    let sampleExercises: [Exercise] = [
        Exercise(name: "Plank", durationInSeconds: 60, description: "Straighten your body!"),
        Exercise(name: "Squat", durationInSeconds: 30, description: "Try doing 10 squats"),
        Exercise(name: "Lunge", durationInSeconds: 50, description: "")
    ]
    
    func populateExerciseIDDict() {
        // TODO: this needs to be done when the app launches
        for exercise in sampleExercises {
            exerciseIDDict[exercise.id] = exercise
        }
    }
    
    func getExercisesForWorkout(workout: Workout, exerciseIds: [UUID]) {
        var exerciseList: [Exercise] = []
        for exerciseId in exerciseIds {
            let exerciseFound = exerciseIDDict[exerciseId]
            if exerciseFound != nil {
                let newExerciseFoundCopy = exerciseFound?.copy() as! Exercise
                exerciseList.append(newExerciseFoundCopy)
            }
            // TODO: else throw error
            else {
                print("exercise not found!")
            }
        }
        workout.exercises = exerciseList
    }
    
    func getSingleExerciseForWorkout(workout: Workout, exerciseId: UUID) {
        let exerciseFound = exerciseIDDict[exerciseId]
        if exerciseFound != nil {
            let newExerciseFoundCopy = exerciseFound?.copy() as! Exercise
            workout.exercises.append(newExerciseFoundCopy)
        }
        // TODO: else throw error
        else {
            print("exercise not found!")
        }
    }
    
    func createSampleWorkouts() -> [Workout] {
        return [
            Workout(name: "Morning", exercisesID: [self.sampleExercises[0].id, self.sampleExercises[1].id], description: "After breakfast"),
            Workout(name: "Night", exercisesID: [self.sampleExercises[1].id, self.sampleExercises[2].id], description: "Before bed"),
        ]
    }
    
    var sampleWorkouts: [Workout] {createSampleWorkouts()}
}
