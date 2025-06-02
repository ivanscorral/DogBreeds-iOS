//
//  Breed.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

struct Breed: Hashable, Identifiable {
    var id: String { fullName }
    
    let name: String
    let subBreeds: [String]
    
    var hasSubBreeds: Bool { !subBreeds.isEmpty }
    var fullName: String { name.capitalized }
}
