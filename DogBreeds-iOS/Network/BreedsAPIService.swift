//
//  BreedsAPIService.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

final class BreedsAPIService: BreedAPIProtocol {
    static let shared = BreedsAPIService()
    
    private init() {}
    
    func fetchBreeds() async throws -> [Breed] {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(BreedsResponse.self, from: data)
        
        return decoded.message.map {
            Breed(name: $0.key, subBreeds: $0.value)
        }
    }
    
    func fetchImage(for breedName: String) async throws -> String {
        let url = URL(string: "https://dog.ceo/api/breed/\(breedName)/images/random")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(BreedImageResponse.self, from: data)
        return decoded.message
    }
    
    
}
