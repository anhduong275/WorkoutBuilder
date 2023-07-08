//
//  WorkoutView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/24/23.
//

import SwiftUI

struct WorkoutView: View {
    @ObservedObject var workout: Workout
    @State var allExercises: [Exercise] = DataStore.sharedDataStore.sampleExercises
    
    func sumUpWorkoutTime(workoutExercises: [Exercise]) -> Int{
        let workoutTimeArr = workoutExercises.map { $0.durationInSeconds }
        return workoutTimeArr.reduce(0, +)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Details")) {
                    HStack {
                        Label("Name", systemImage: "square.and.pencil")
                        Spacer()
                        TextField("Name", text: $workout.name)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Label("Description", systemImage: "ellipsis.bubble")
                        Spacer()
                        TextField("Description", text: $workout.description, axis: .vertical)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(3)
                            .truncationMode(.tail)
                    }
                    HStack {
                        Label("Total time (seconds)", systemImage: "clock.arrow.circlepath")
                        Spacer()
                        Text("\(sumUpWorkoutTime(workoutExercises: workout.exercises))")
                            .multilineTextAlignment(.trailing)
                    }
                }
                Section(header: Text("Exercises in this workout")) {
                    // for some reason, adding a parent list does not work here
                    ForEach(workout.exercises, id: \.id) { exercise in
                        NavigationLink(destination: ExerciseDetailView(exercise: exercise))
                        {
                            Text(exercise.name)
                        }
                    }
                    NavigationLink(destination: ExercisePickerView(exercises: $allExercises,
                        workout: workout)) {
                        Text("Add exercises")
                            .foregroundColor(.accentColor)
                    }
                }
                
            }
            .navigationTitle("Workout Details")
            .onAppear {
                DataStore.sharedDataStore.populateExerciseIDDict()
                DataStore.sharedDataStore.getExercisesForWorkout(workout: workout, exerciseIds: workout.exercisesID)
            }
            
        }
    }
}

struct WorkoutView_Previews:
    PreviewProvider {
    static var workout: Workout = Workout(name: "Friday", exercisesID: [DataStore.sharedDataStore.sampleExercises[0].id], description: "For Friday afternoons")
    static var previews: some View {
        WorkoutView(workout: workout)
    }
}
