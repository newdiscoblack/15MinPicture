//
//  FaceView.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

struct FaceView: View {
    @Binding var timeRemaining: TimeInterval
    
    var body: some View {
        HStack {
            VStack {
                if timeRemaining == 0 {
                    Image(systemName: "gift.fill")
                        .font(.system(size: 80))
                        .animation(.default)
                }
            }
            VStack {
                Image(systemName: "eyes")
                    .font(.system(size: 50))
                Image(systemName: "nose")
                    .font(.system(size: 60))
                Image(systemName: "mouth")
                    .font(.system(size: 55))
            }
            .animation(.default)
        }
    }
}
