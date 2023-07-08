//
//  WorkoutListView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/24/23.
//

import SwiftUI

struct WorkoutListView: View {
    @Binding var workouts: [Workout]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($workouts) { $workout in
                    NavigationLink(destination: WorkoutView(workout: workout)) {
                        Text($workout.name.wrappedValue)
                    }
                }
            }
            .navigationTitle("Workout List")
            .toolbar {
                Button("Add") {}
            }
        }
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var workouts: [Workout] = [Workout(name: "Friday", exercisesID: [], description: "nice")]
    static var previews: some View {
        WorkoutListView(workouts: .constant(workouts))
    }
}
