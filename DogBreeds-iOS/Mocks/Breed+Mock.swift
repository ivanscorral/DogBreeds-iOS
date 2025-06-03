//
//  Breed+Mock.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

extension Breed {
    static let mock1: Breed = .init(name: "labrador", subBreeds: ["golden", "black"])
    static let mock2: Breed = .init(name: "poodle", subBreeds: ["standard", "miniature", "toy"])
    static let mock3: Breed = .init(name: "bulldog", subBreeds: [])
}

extension Array where Element == Breed {
    static let mock: [Breed] = [.mock1, .mock2, .mock3]
}
