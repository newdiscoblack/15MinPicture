//
//  CountdownTimer.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

struct CountdownTimer: View {
    @Binding var timeRemaining: TimeInterval
    @Binding var isAppActive: Bool
    
    let timer = Timer
        .publish(
            every: 1.0,
            on: .main,
            in: .common
        )
        .autoconnect()

    var body: some View {
        Text("\(timeRemainingString(timeRemaining))")
            .font(.custom("DS-Digital", size: 60.0))
            .frame(width: 240, height: 90.0)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(20.0)
            .padding()
            .onReceive(timer) { time in
                guard isAppActive else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
    }
    
    private func timeRemainingString(_ timeRemaining: TimeInterval) -> String {
        let hours = Int(timeRemaining)/3600
        let minutes = Int(timeRemaining)/60 % 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
}
