//
//  WorkoutBuilderApp.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//

import SwiftUI

@main
struct WorkoutBuilderApp: App {
    @State private var workouts = DataStore.sharedDataStore.sampleWorkouts;
    @State private var exercises = DataStore.sharedDataStore.sampleExercises;
    
    var body: some Scene {
        WindowGroup {
            HomeView(workouts: $workouts, exercises: $exercises)
        }
    }
}
