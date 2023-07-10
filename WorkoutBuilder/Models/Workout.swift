//
//  Workout.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/24/23.
//

import Foundation

class Workout: Identifiable, ObservableObject {
    let id: UUID
    @Published var name: String
    @Published var exercisesID: [UUID]
    @Published var description: String
    @Published var exercises: [Exercise] = []
    
    init(id: UUID = UUID(), name: String, exercisesID: [UUID] = [], description: String) {
        self.id = id
        self.name = name
        self.exercisesID = exercisesID
        self.description = description
    }
}
