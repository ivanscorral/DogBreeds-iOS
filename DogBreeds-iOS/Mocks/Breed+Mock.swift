//
//  Breed+Mock.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

extension Breed {
    static var mock: Breed {
        .init(name: "affenpinscher", subBreeds: [])
    }
}

extension Array where Element == Breed {
    static var mock: [Breed] {
        [
            .init(name: "affenpinscher", subBreeds: []),
            .init(name: "african", subBreeds: []),
            .init(name: "airedale", subBreeds: ["australian", "irish"]),
        ]
    }
}
