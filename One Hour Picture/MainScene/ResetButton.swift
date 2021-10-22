//
//  ResetButton.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

struct ResetButton: View {
    @Binding var timeRemainingCurrently: TimeInterval
    var onButtonTapped: () -> Void
    
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
