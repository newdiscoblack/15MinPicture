//
//  View+isHidden.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 22/10/2021.
//

import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
