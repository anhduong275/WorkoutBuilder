//
//  NewWorkoutSheet.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 7/8/23.
//

import SwiftUI

struct NewWorkoutSheet: View {
    @ObservedObject var emptyWorkout: Workout = Workout(name: "", description: "")
    @Binding var isPresentingEmptyWorkoutSheet: Bool
    var isView: Bool
    
    @ViewBuilder
    var body: some View {
        NavigationStack {
            WorkoutView(workout: emptyWorkout)
                .toolbar {
                    if (!isView) {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEmptyWorkoutSheet = false
                            }
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            DataStore.sharedDataStore.addWorkout(workout: emptyWorkout)
                            if (!isView) {
                                isPresentingEmptyWorkoutSheet = false
                            }
                        }
                    }
                }
        }
    }
}

struct NewWorkoutSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutSheet(isPresentingEmptyWorkoutSheet: .constant(true), isView: false)
    }
}
