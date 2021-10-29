//
//  CountdownTimer.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import Combine
import SwiftUI

struct CountdownTimer: View {
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    private var timeRemainingCurrently: String
    private var shouldAnimateBackgroundColor: Bool
    private var onRefreshCountdownTimerView: () -> Void
    
    init(
        timer: Publishers.Autoconnect<Timer.TimerPublisher>,
        timeRemainingCurrently: String,
        shouldAnimateBackgroundColor: Bool,
        onRefreshCountdownTimerView: @escaping () -> Void
    ) {
        self.timer = timer
        self.timeRemainingCurrently = timeRemainingCurrently
        self.shouldAnimateBackgroundColor = shouldAnimateBackgroundColor
        self.onRefreshCountdownTimerView = onRefreshCountdownTimerView
    }

    var body: some View {
        Text(timeRemainingCurrently)
            .font(.custom("DS-Digital", size: 60.0))
            .frame(width: 240, height: 90.0)
            .foregroundColor(.white)
            .background(
                shouldAnimateBackgroundColor ? Color.red : Color.black
            )
            .cornerRadius(20.0)
            .padding()
            .onReceive(timer) { time in
                onRefreshCountdownTimerView()
            }
    }
}
