//
//  SavedPlaceView.swift
//  PinIt Watch App
//
//  Created by Tania Cresentia on 23/05/24.
//

import SwiftUI
import SwiftData

struct SavedPlaceView: View {
    @StateObject var viewModel = SavedPlaceViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(viewModel.places) { place in
                    PlaceCard(place: place)
                        .onTapGesture {
                            viewModel.showMap = true
                            viewModel.thePlace = place
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let willBeDeletedPlace = viewModel.places[index]
                        viewModel.context.delete(willBeDeletedPlace)
                    }
                })
            }
            .navigationTitle("Saved Place")
        }
        .navigationDestination(isPresented: $viewModel.showMap) {
            NavView(place: viewModel.thePlace)
        }
    }
}

struct PlaceCard: View {
    var place: Place
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 2.0)
                .background(.blue.opacity(0.2))
                .frame(width: 180, height: 100)
            HStack {
                Text(place.emoji ?? "")
                    .font(.title)
                VStack(alignment: .leading){
                    Text(place.name ?? "No Name")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(place.date ?? "No Date")
                        .font(.caption2)
                        .fontWeight(.thin)
                }
                Spacer()
            }
            .foregroundStyle(.blue)
            .padding(.horizontal, 20)
        }
    }
}

#Preview{
    SavedPlaceView()
}
