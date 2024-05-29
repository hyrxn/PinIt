//
//  Place.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 23/05/24.
//

import Foundation
//import CoreLocation
import SwiftData

@Model
class Place: Identifiable {
    let id = UUID()
    
    var emoji: String? = ""
    var name: String? = ""
    var date: String? = ""
    var latitude: Double? = 0.0
    var longitude: Double? = 0.0
    
    init(emoji: String? = nil, name: String? = nil, date: String? = nil, latitude: Double? = nil, longitude: Double? = nil) {
        self.emoji = emoji
        self.name = name
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
    }
}
