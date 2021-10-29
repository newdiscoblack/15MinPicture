//
//  CountdownView.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 21/10/2021.
//

import SwiftUI

struct CountdownView: View {
    @StateObject var viewModel: CountdownViewModel = CountdownViewModel.init()
    
    var body: some View {
        VStack {
            Spacer()
            CountdownTimer(
                timer: viewModel.timer,
                timeRemainingCurrently: viewModel.timeRemainingCurrentlyString,
                shouldAnimateBackgroundColor: viewModel.shouldAnimateBackgroundColor,
                onRefreshCountdownTimerView: viewModel.refreshCountdownTimerView
            )
            Spacer()
            FaceView(
                timeRemaining: viewModel.timeRemainingCurrently
            )
            Spacer()
            ResetButton(
                timeRemainingCurrently: viewModel.timeRemainingCurrently,
                onButtonTapped: viewModel.resetTimer
            )
            Spacer()
        }
        .onReceive(
            NotificationCenter
                .default
                .publisher(
                    for: UIApplication.willResignActiveNotification
                )
        ) { _ in viewModel.onWillResignActiveNotification() }
        .onReceive(
            NotificationCenter
                .default
                .publisher(
                    for: UIApplication.willEnterForegroundNotification
                )
        ) { _ in viewModel.onWillEnterForegroundNotification() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
