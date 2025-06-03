//
//  BreedListViewModel+Mock.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation

extension BreedListViewModel {
    static var mock: BreedListViewModel {
        let mockApiService = BreedsAPIServiceMock()
        mockApiService.breeds = .mock
        let viewModel = BreedListViewModel(apiService: mockApiService)
        return viewModel
    }
}
