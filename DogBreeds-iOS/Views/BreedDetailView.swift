//
//  BreedDetailView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedDetailView: View {
    let breedDetailViewModel: BreedDetailViewModel
    
    init(breed: Breed) {
        self.breedDetailViewModel = .init(breed: breed)
    }
    
    var body: some View {
        VStack {
            Text(breedDetailViewModel.name)
                .font(.title)
            if let imageURL = breedDetailViewModel.imageURL {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
            }
        }
        .task {
            await breedDetailViewModel.loadImage()
        }
    }
}

#Preview {
    BreedDetailView(breed: .mock)
}
