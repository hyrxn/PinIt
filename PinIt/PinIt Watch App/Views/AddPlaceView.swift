//
//  AddPlaceView.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 23/05/24.
//

import SwiftUI

struct AddPlaceView: View {
    @StateObject var viewModel = AddPlaceViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    var isSubmitDisabled: Bool {
        viewModel.placeName.count < 3 || viewModel.placeName.count > 20 || viewModel.placeEmoji.count != 1
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Name", text: $viewModel.placeName)
                    .onReceive(viewModel.placeName.publisher.collect()) { newValue in
                        if newValue.count > 20 {
                            viewModel.placeName = String(newValue.prefix(20))
                        }
                    }
                
                TextField("Emoji", text: $viewModel.placeEmoji)
                    .onReceive(viewModel.placeEmoji.publisher.collect()) { newValue in
                        if newValue.count > 1 {
                            viewModel.placeEmoji = String(newValue.prefix(1))
                        }
                    }
                
                
                Button {
                    if viewModel.isDataValid() {
                        saveNewPlace()
                        viewModel.showAlert = true
                    } else {
                        viewModel.showInvalidDataAlert = true
                    }
                } label: {
                    Text("Submit")
                }
                .tint(.green)
                .disabled(isSubmitDisabled)
            }
            .navigationTitle("Add Place")
            .alert("Place Successfully Saved!", isPresented: $viewModel.showAlert) {
                
            }
        }
    }
    
    func saveNewPlace(){
        let newPlace = Place(
            emoji: viewModel.placeEmoji,
            name: viewModel.placeName,
            date: viewModel.getCurrentDate(),
            
            //get the latitude and longitude data first
            latitude: viewModel.locationManager.location?.coordinate.latitude,
            longitude: viewModel.locationManager.location?.coordinate.longitude
        )
        
        context.insert(newPlace)
    }
    
}

#Preview {
    AddPlaceView()
}
