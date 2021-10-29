//
//  ResetButton.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

struct ResetButton: View {
    private var timeRemainingCurrently: TimeInterval
    private var onButtonTapped: () -> Void
    
    init(
        timeRemainingCurrently: TimeInterval,
        onButtonTapped: @escaping () -> Void
    ) {
        self.timeRemainingCurrently = timeRemainingCurrently
        self.onButtonTapped = onButtonTapped
    }
    
    var body: some View {
            Text("Reset")
                .font(.title)
                .animation(.default)
                .onTapGesture {
                    onButtonTapped()
                }
                .isHidden(!(timeRemainingCurrently == 0))
    }
}
