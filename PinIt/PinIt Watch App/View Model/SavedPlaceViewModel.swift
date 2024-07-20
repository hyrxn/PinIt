//
//  SavedPlaceViewModel.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 27/05/24.
//

import SwiftUI
import SwiftData

final class SavedPlaceViewModel: ObservableObject {
    @Query var places: [Place]
    
    @Published var showMap = false
    @Published var thePlace: Place = Place(
        emoji: "🍦",
        name: "Fav Ice Cream",
        date: "25/05/2024",
        latitude: -6.277,
        longitude: 106.277)
}
