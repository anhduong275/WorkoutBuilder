//
//  ExercisePicker.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/24/23.
//

import SwiftUI

struct ExercisePickerView: View {
    @Binding var exercises: [Exercise]
    @StateObject var workout: Workout
    // = Exercise(name: "Empty", durationInSeconds: 0, description: "")
//    private func convertIdsToExercises(ids: [UUID]) -> [Exercise] {
//        return DataStore.sharedDataStore.getExercisesForWorkout(exerciseIds: ids)
//    }

    var body: some View {
        List {
            Section(header: Text("Add exercise to your workout")) {
                ForEach($exercises) { $exercise in
                    HStack {
                        Text($exercise.name.wrappedValue)
                        Text("\($exercise.durationInSeconds.wrappedValue) seconds").foregroundColor(.secondary)
                        Spacer()
                        Button {
                            workout.exercisesID.append(exercise.id)
                            DataStore.sharedDataStore.getSingleExerciseForWorkout(workout: workout, exerciseId: exercise.id)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
            }
            Section(header: Text("Added exercises")) {
                ForEach(Array(zip(workout.exercises.indices, workout.exercises)), id: \.1) { index, exercise in
                    HStack {
                        Text(exercise.name)
                        Text("\(exercise.durationInSeconds) seconds").foregroundColor(.secondary)
                        Spacer()
                        Button {
                            workout.exercisesID.remove(at: index)
                            workout.exercises.remove(at: index)
                        } label: {
                            Image(systemName: "minus.circle.fill")
                        }
                    }
                }
            }
        }
        .navigationTitle("Add exercises")
        .onWillAppear {
            DataStore.sharedDataStore.populateExerciseIDDict()
            DataStore.sharedDataStore.getExercisesForWorkout(workout: workout, exerciseIds: workout.exercisesID)
        }
    }
}

struct ExercisePickerView_Previews: PreviewProvider {
    static var exercises: [Exercise] = []
    static var workout: Workout = Workout(name: "Friday", exercisesID: [DataStore.sharedDataStore.sampleExercises[0].id], description: "For Friday afternoons")
    static var previews: some View {
        NavigationStack {
            ExercisePickerView(exercises: .constant(DataStore.sharedDataStore.sampleExercises), workout: workout)
        }
    }
}
