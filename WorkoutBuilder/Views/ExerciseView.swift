//
//  ExerciseView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        HStack {
            Text(exercise.name)
                .font(.headline)
            Spacer()
            Label("\(exercise.durationInSeconds)", systemImage: "clock")
                .labelStyle(.trailingIcon)
        }
        .padding()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: .constant(DataStore.sharedDataStore.sampleExercises[0]))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
