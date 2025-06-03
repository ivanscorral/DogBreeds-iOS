//
//  BreedListViewModel+Mock.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation

extension BreedListViewModel {
    static var mockLoaded: BreedListViewModel {
        let viewModel = BreedListViewModel()
        viewModel.breeds = .mock
        return viewModel
    }
}

