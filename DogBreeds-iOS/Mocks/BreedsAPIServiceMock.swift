//
//  BreedsAPIServiceMock.swift
//  DogBreeds-iOSTests
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation

final class BreedsAPIServiceMock: BreedAPIProtocol {
    var breeds: [Breed] = []
    var images: [String: String] = [:]
    
    func fetchBreeds() async throws -> [Breed] {
        breeds
    }
    
    func fetchImageURL(for breedName: String) async throws -> String {
        images[breedName] ?? ""
    }
}
