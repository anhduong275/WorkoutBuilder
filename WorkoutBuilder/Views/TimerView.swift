//
//  TimerView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 7/14/23.
//

import SwiftUI

struct TimerView: View {
    @Binding var totalTime: Int;
    @StateObject var timer: ExerciseTimer;
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(
                        lineWidth: 24
                    ))
                Circle()
                    .trim(from: 0, to: CGFloat(timer.secondsElapsed) / CGFloat(timer.totalTime))
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 24,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(
                        .easeInOut(duration: 2), value: CGFloat(timer.secondsElapsed) / CGFloat(timer.totalTime))
            }
            Button("Start") {
                timer.startTimer()
            }
            Button("Pause") {
                timer.pauseTimer()
            }
            Button("Resume") {
                timer.resumeTimer()
            }
            Button("Stop") {
                timer.stopTimer()
            }
        }
        .padding(30)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var totalTime: Int = 60;
    
    static var previews: some View {
        TimerView(totalTime: .constant(totalTime), timer:  ExerciseTimer(totalTime: totalTime))
    }
}
