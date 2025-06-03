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
    private let apiService: BreedAPIProtocol
    
    var isLoading: Bool = false
    var imageURL: URL? = nil
    var errorMessage: String?
    
    var name: String { breed.name.capitalized }
    var subBreeds: [String] { breed.subBreeds.map { $0.capitalized } }
    
    init(breed: Breed, apiService: BreedAPIProtocol = BreedsAPIService.shared) {
        self.breed = breed
        self.apiService = apiService
    }
    
    func loadImage() async {
        isLoading = true
       
        do {
            let url = try await apiService.fetchImageURL(for: breed.name)
            guard let imageURL = URL(string: url) else {
                throw URLError(.badURL)
            }
            self.imageURL = imageURL
        } catch {
            imageURL = nil
            errorMessage = "Error fetching image. Please try again"
        }
        
        isLoading = false
    }
    
}
