//
//  PinItApp.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 23/05/24.
//

import SwiftUI
import SwiftData

@main
struct PinIt_Watch_AppApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
        .modelContainer(for: [
            Place.self
        ])
    }
}
