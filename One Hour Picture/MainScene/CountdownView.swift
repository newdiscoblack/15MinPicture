//
//  CountdownView.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 21/10/2021.
//

import SwiftUI

struct CountdownView: View {
    private var timeRemainingAtTheStart: TimeInterval = .hour
    
    @State private var timeRemainingCurrently: TimeInterval
    @State private var isAppActive: Bool = true
    
    init() {
        _timeRemainingCurrently = State(
            initialValue: timeRemainingAtTheStart
        )
    }

    var body: some View {
        VStack {
            Spacer()
            CountdownTimer(
                timeRemaining: $timeRemainingCurrently,
                isAppActive: $isAppActive
            )
            Spacer()
            FaceView(
                timeRemaining: $timeRemainingCurrently
            )
            Spacer()
            ResetButton(
                timeRemainingCurrently: $timeRemainingCurrently,
                onButtonTapped: resetTimer
            )
            Spacer()
        }
        .onReceive(
            NotificationCenter
                .default
                .publisher(
                    for: UIApplication.willResignActiveNotification
                )
        ) { _ in
            self.isAppActive = false
        }
        .onReceive(
            NotificationCenter
                .default
                .publisher(
                    for: UIApplication.willEnterForegroundNotification
                )
        ) { _ in
            self.isAppActive = true
        }
    }
    
    private func resetTimer() {
        timeRemainingCurrently = timeRemainingAtTheStart
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
