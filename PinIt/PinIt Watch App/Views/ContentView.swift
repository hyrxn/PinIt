//
//  ContentView.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 23/05/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @StateObject var viewModel = ContentViewModel()
    
//    TODO: Put in views folder
    
    var body: some View {
        NavigationStack{
            ZStack{
                Map {
                    Annotation ("My Location",
                                coordinate: CLLocationCoordinate2D(
                                    latitude: locationManager.location?.coordinate.latitude ?? 0.0,
                                    longitude: locationManager.location?.coordinate.longitude ?? 0.0)
                    ){
                        ZStack {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.blue.opacity(0.25))
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.white)
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.blue)
                        }
                    }
                }
                .ignoresSafeArea()
                
            }
            .overlay(alignment: .bottom, content: {
                HStack (spacing: 110){
                    Button {
                        viewModel.showRecord = true
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 30, height: 30)
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 18)
                                .foregroundStyle(.red)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button {
                        viewModel.addPlace = true
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 30, height: 30)
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 18)
                                .foregroundStyle(.red)
                        }
                    }
                    .buttonStyle(.plain)
                }
            })
            .navigationDestination(isPresented: $viewModel.showRecord) {
                SavedPlaceView()
            }
            .sheet(isPresented: $viewModel.addPlace){
                                AddPlaceView()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
/// ga bisa preview karena harus retrieve location user -> bisa jalannya di simulator
