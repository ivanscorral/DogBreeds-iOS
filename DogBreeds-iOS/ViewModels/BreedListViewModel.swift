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
    var isLoading: Bool = true
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
    
    private let apiService = DogAPIService.shared
    
    func loadBreeds() async {
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let fetchedBreeds = try await apiService.fetchAllBreeds()
            breeds = fetchedBreeds
            print("Fetched breeds: \(breeds)")
        } catch {
            print("Error fetching breeds: \(error)")
            breeds = []
        }
        isLoading = false
    }
}
