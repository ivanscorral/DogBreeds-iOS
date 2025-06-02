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
    
    var filteredBreeds: [Breed] {
        guard !searchText.isEmpty else {
            return breeds
        }
        
        return breeds.filter { breed in
            breed.name.localizedCaseInsensitiveContains(searchText) || breed.subBreeds.contains(
                where: { $0.localizedCaseInsensitiveContains(searchText) })
        }
    }
    
    private let apiService = BreedsAPIService.shared
    
    func loadBreeds() async {
        guard breeds.isEmpty else { return }
        isLoading = true
        do {
            let fetchedBreeds = try await apiService.fetchAllBreeds()
            breeds = fetchedBreeds
        } catch {
            print("Error fetching breeds: \(error)")
            breeds = []
        }
        isLoading = false
    }
}
