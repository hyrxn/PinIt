//
//  NavView.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 25/05/24.
//

import SwiftUI
import MapKit

struct NavView: View {
    var place: Place
    
    var body: some View {
        Map {
            Annotation(place.name ?? "", coordinate: CLLocationCoordinate2D(latitude: place.latitude ?? 0.0, longitude: place.longitude ?? 0.0))
            {
                ZStack {
                    Circle()
                        .frame(width: 38, height: 38)
                        .foregroundStyle(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                    Text(place.emoji ?? "")
                        .font(.title3)
                }
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavView(place: Place(
        emoji: "🍦",
        name: "Fav Ice Cream",
        date: "25/05/2024",
        latitude: -6.277,
        longitude: 106.277))
}
