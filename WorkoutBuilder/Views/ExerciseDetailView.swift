//
//  ExerciseDetailView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    @ObservedObject var exercise: Exercise
    @State private var exerciseName: String = "Plank"
    
    var body: some View {
        List {
            HStack {
                Label("Name", systemImage: "dumbbell")
                Spacer()
                TextField("Name", text: $exercise.name)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Label("Duration in seconds", systemImage: "clock.arrow.circlepath")
                Spacer()
                TextField("Duration", value:
                            $exercise.durationInSeconds, formatter: NumberFormatter())
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Label("Description", systemImage: "ellipsis.bubble")
                Spacer()
                TextField("Description", text: $exercise.description, axis: .vertical)
                    .multilineTextAlignment(.trailing)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }
        }
        .navigationTitle("Exercise Details")
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExerciseDetailView(exercise: DataStore.sharedDataStore.sampleExercises[0])
        }
    }
}
