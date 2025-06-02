//
//  DogAPIService.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

final class DogAPIService {
    static let shared = DogAPIService()
    
    private init() {}
    
    func fetchAllBreeds() async throws -> [Breed] {
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(BreedsResponse.self, from: data)
        
        return decoded.message.map {
            Breed(name: $0.key, subBreeds: $0.value)
        }.sorted { $0.name < $1.name }
    }
    
    func fetchImage(for breed: String, subBreed: String? = nil) async throws -> String {
        let urlString: String
        if let subBreed = subBreed {
            urlString = "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random"
        } else {
            urlString = "https://dog.ceo/api/breed/\(breed)/images/random"
        }
        
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(BreedImageResponse.self, from: data)
        return decoded.message
    }
}
