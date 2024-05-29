//
//  AddPlaceViewModel.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 27/05/24.
//

import SwiftUI

final class AddPlaceViewModel: ObservableObject {
    @EnvironmentObject var locationManager: LocationManager
    
    /// ??
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
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
    
    func saveNewPlace(){
        let newPlace = Place(
            emoji: placeEmoji,
            name: placeName,
            date: getCurrentDate(),
            
            //get the latitude and longitude data first
            latitude: locationManager.location?.coordinate.latitude,
            longitude: locationManager.location?.coordinate.longitude
        )
        
        context.insert(newPlace)
    }
    
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: Date())
    }
}
