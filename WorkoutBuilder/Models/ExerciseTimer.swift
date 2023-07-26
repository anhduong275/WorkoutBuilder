//
//  Timer.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 7/14/23.
//

import Foundation

@MainActor
final class ExerciseTimer: ObservableObject {
    @Published var secondsElapsed: Int;
    @Published var totalTime: Int;
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var timer: Timer?;
//    private var timerStopped = true;
    private var timerPaused = false;
    private var startDate: Date?;
    private var secondsPaused = 0;
    private var totalSecondsPaused = 0;
    private var pauseDate: Date?;
    
    init(totalTime: Int) {
        self.secondsElapsed = 0
        self.totalTime = totalTime
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) {
            timer in
            self.updateTimer()
        }
//        timerStopped = false
        startDate = Date()
    }
    
    func stopTimer() {
        timer?.invalidate()
//        timerStopped = true
        timerPaused = false // just in case
        totalSecondsPaused = 0
        startDate = nil
    }
    
    func pauseTimer() {
        timerPaused = true
        pauseDate = Date()
    }
    
    func resumeTimer() {
        timerPaused = false
        totalSecondsPaused += secondsPaused
        secondsPaused = 0
    }
    
    nonisolated func updateTimer() { // nonisolated to conform to Timer
        Task { @MainActor in // MainActor because WorkoutTimer's properties are isolated
            if (timerPaused) {
                guard let pauseDate else { return }
                secondsPaused = Int(Date.timeIntervalSinceReferenceDate - pauseDate.timeIntervalSinceReferenceDate)
                print(secondsPaused)
                return
            }
            
            guard let startDate, !timerPaused else { return }
            secondsElapsed = Int(Date.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) - totalSecondsPaused
//            print(secondsElapsed)
        }
    }
}
