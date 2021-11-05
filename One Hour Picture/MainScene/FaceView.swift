//
//  FaceView.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

struct FaceView: View {
    private var timeRemaining: TimeInterval
    
    init(
        timeRemaining: TimeInterval
    ) {
        self.timeRemaining = timeRemaining
    }
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "eyes")
                    .font(.system(size: 50))
                Image(systemName: "nose")
                    .font(.system(size: 60))
                Image(systemName: "mouth")
                    .font(.system(size: 55))
            }
            .animation(.default)
            .isHidden((timeRemaining == 0))
        }
    }
}
