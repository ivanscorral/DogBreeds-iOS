//
//  BreedListViewModel.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

@Observable
final class BreedListViewModel {
    var breeds: [Breed] = []
    var isLoading: Bool = false
    var searchText: String = ""
    var errorMessage: String?
    
    var filteredBreeds: [Breed] {
        guard !searchText.isEmpty else {
            return breeds
        }
        
        return breeds.filter { breed in
            breed.name.localizedCaseInsensitiveContains(searchText) || breed.subBreeds.contains(
                where: { $0.localizedCaseInsensitiveContains(searchText) })
        }
    }
    
    let apiService: BreedAPIProtocol
    
    init(apiService: BreedAPIProtocol = BreedsAPIService.shared) {
        self.apiService = apiService
    }
    
    func loadBreeds() async {
        guard breeds.isEmpty else { return }
        isLoading = true
        do {
            let fetchedBreeds = try await apiService.fetchBreeds()
            breeds = fetchedBreeds
        } catch {
            print("Error fetching breeds: \(error)")
            errorMessage = "Error fetching breeds. Please try again later."
            breeds = []
        }
        isLoading = false
    }
}
