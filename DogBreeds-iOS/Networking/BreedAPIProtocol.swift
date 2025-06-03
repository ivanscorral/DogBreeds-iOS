//
//  BreedAPIProtocol.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation

protocol BreedAPIProtocol {
    func fetchBreeds() async throws -> [Breed]
    func fetchImageURL(for breedName: String) async throws -> String
}
