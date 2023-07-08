//
//  ExerciseListView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//

import SwiftUI

struct ExerciseListView: View {
    @Binding var exercises: [Exercise]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($exercises) { $exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise))
                    {
                        ExerciseView(exercise: $exercise)
                    }
                }
            }
            .navigationTitle("Exercise List")
        }
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(exercises: .constant(DataStore.sharedDataStore.sampleExercises))
    }
}
