//
//  One_Hour_PictureApp.swift
//  One Hour Picture
//
//  Created by Kacper Jagiełło on 21/10/2021.
//

import SwiftUI

@main
struct One_Hour_PictureApp: App {
    var body: some Scene {
        WindowGroup {
            CountdownView(viewModel: CountdownViewModel())
        }
    }
}
