//
//  AddPlaceViewModel.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 27/05/24.
//

import SwiftUI

final class AddPlaceViewModel: ObservableObject {
    @EnvironmentObject var locationManager: LocationManager
    
    @Published var placeName = ""
    @Published var placeEmoji = ""
    @Published var saveDate = ""
    @Published var showAlert = false
    @Published var showInvalidDataAlert = false
    
    /// ??
    var isSubmitDisabled: Bool {
        placeName.count < 3 || placeName.count > 20 || placeEmoji.count != 1
    }
    
    func getLatitude() -> Double {
        return locationManager.location?.coordinate.latitude ?? 0.0
    }
    
    func getLongitude() -> Double {
        return locationManager.location?.coordinate.longitude ?? 0.0
    }
    
    func isDataValid() -> Bool {
        return placeName.count >= 3 && placeName.count <= 20 && placeEmoji.count == 1
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
}
