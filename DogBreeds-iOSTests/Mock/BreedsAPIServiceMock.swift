//
//  BreedsAPIServiceMock.swift
//  DogBreeds-iOSTests
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation
@testable import DogBreeds_iOS

final class BreedsAPIServiceMock: BreedAPIProtocol {
    var breeds: [Breed] = []
    var images: [String: String] = [:]
    
    func fetchBreeds() async throws -> [Breed] {
        breeds
    }
    
    func fetchImage(for breedName: String) async throws -> String {
        images[breedName] ?? ""
    }
}
