//
//  BreedDetailView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    var body: some View {
        Text("\(breed.fullName)")
            .font(.title)
            .navigationTitle(breed.fullName)
            .padding()
    }
}

#Preview {
    BreedDetailView(breed: .mock)
}
