//
//  HomeView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let singleColumn = [GridItem(.flexible())]
    @Binding var workouts: [Workout]
    @Binding var exercises: [Exercise]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: singleColumn) {
                    NavigationLink(destination: WorkoutListView(workouts: $workouts)) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .aspectRatio(2.0, contentMode: .fit)
                            .overlay(Text("All Workouts")
                               .padding()
                               .font(.largeTitle)
                               .foregroundColor(Color.white))
                            .padding([.horizontal, .top])
                    }
                }
                .padding(.bottom)
                LazyVGrid(columns: columns) {
                    NavigationLink(destination: NewWorkoutSheet(isPresentingEmptyWorkoutSheet: .constant(true), isView: true)) {
                        HomeIconView(label: "Build a Workout", isLeft: true,
                             fillColor: Color.blue)
                    }
                    NavigationLink(destination: ExerciseListView(exercises: $exercises)) {
                        HomeIconView(label: "All Exercises", isLeft: false,
                            fillColor: Color.red)
                    }
                 }
                .padding(.bottom)
                Text("Tip: To start a workout, select a workout in All Workouts").multilineTextAlignment(.center)
             }
            .navigationTitle("Workout Builder")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var workouts: [Workout] = [Workout(name: "Friday", exercisesID: [], description: "nice")]
    static var previews: some View {
        HomeView(workouts: .constant(workouts), exercises: .constant(DataStore.sharedDataStore.sampleExercises))
    }
}
