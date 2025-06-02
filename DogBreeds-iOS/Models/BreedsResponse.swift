//
//  BreedsResponse.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import Foundation

struct BreedsResponse: Decodable {
    typealias Breeds = [String: [String]]
    
    let message: Breeds
    let status: String
}
