//
//  BreedDetailViewModel.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

@Observable
class BreedDetailViewModel {
    private let breed: Breed
    private let apiService = BreedsAPIService.shared
    
    var isLoading: Bool = false
    var imageURL: URL? = nil
    
    var name: String { breed.name.capitalized }
    var subBreeds: [String] { breed.subBreeds.map { $0.capitalized } }
    
    init(breed: Breed) {
        self.breed = breed
    }
    
    func loadImage() async {
        isLoading = true
       
        do {
            let url = try await apiService.fetchImage(for: breed.name)
            imageURL = URL(string: url)!
        } catch {
            print("Failed to fetch image: \(error)")
            imageURL = nil
        }
        
        isLoading = false
    }
    
}
