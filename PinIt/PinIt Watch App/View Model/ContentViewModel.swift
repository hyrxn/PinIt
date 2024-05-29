//
//  ContentViewModel.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 27/05/24.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @EnvironmentObject var locationManager: LocationManager
    @Published var showRecord = false
    @Published var addPlace = false
    
    func getLatitude() -> Double {
        return locationManager.location?.coordinate.latitude ?? 0.0
    }
    
    func getLongitude() -> Double {
        return locationManager.location?.coordinate.longitude ?? 0.0
    }
}
