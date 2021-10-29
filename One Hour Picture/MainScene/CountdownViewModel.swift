//
//  CountdownViewModel.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 28/10/2021.
//

import SwiftUI

class CountdownViewModel: ObservableObject {
    private var timeRemainingAtTheStart: TimeInterval = .fifteenMinutes
    private var finalCountdownStartingPoint: TimeInterval = .twoMinutes
    
    public var timeRemainingCurrentlyString: String {
        return getTimeRemainingCurrentlyString()
    }
    
    @Published var timeRemainingCurrently: TimeInterval
    @Published var isAppActive: Bool
    @Published var shouldAnimateBackgroundColor: Bool
    
    @Published var timer = Timer
        .publish(
            every: 1.0,
            on: .main,
            in: .common
        )
        .autoconnect()
    
    init() {
        _timeRemainingCurrently = Published(initialValue: timeRemainingAtTheStart)
        _isAppActive = Published(initialValue: true)
        _shouldAnimateBackgroundColor = Published(initialValue: false)
    }

    public func refreshCountdownTimerView() {
        performCountdownSubtractionIfTimerIsRunning()
        toggleBackgroundColorAnimationIfCountdownIsComingToAnEnd()
    }
    
    public func resetTimer() {
        timeRemainingCurrently = timeRemainingAtTheStart
        shouldAnimateBackgroundColor = false
    }
    
    public func onWillEnterForegroundNotification() {
        isAppActive = true
    }
    
    public func onWillResignActiveNotification() {
        isAppActive = false
    }
    
    private func getTimeRemainingCurrentlyString() -> String {
        return timeRemainingString(timeRemainingCurrently)
    }
    
    private func timeRemainingString(_ timeRemaining: TimeInterval) -> String {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) / 60 % 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    private func performCountdownSubtractionIfTimerIsRunning() {
        guard isAppActive else { return }
        if self.timeRemainingCurrently > 0 {
            self.timeRemainingCurrently -= 1
        }
    }
    
    private func toggleBackgroundColorAnimationIfCountdownIsComingToAnEnd() {
        guard timeRemainingCurrently < finalCountdownStartingPoint else { return }
        withAnimation(.easeInOut) {
            shouldAnimateBackgroundColor.toggle()
        }
    }
}
