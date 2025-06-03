//
//  BreedListViewModelTests.swift
//  DogBreeds-iOSTests
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation
import XCTest
@testable import DogBreeds_iOS

@MainActor
final class BreedListViewModelTests: XCTestCase {
    private var mockService: BreedsAPIServiceMock!
    private var sut: BreedListViewModel!
    
    private let mockBreeds: [Breed] = [
        .init(name: "labrador", subBreeds: ["golden", "black"]),
        .init(name: "poodle", subBreeds: ["standard", "miniature", "toy"]),
        .init(name: "bulldog", subBreeds: []),
    ]
    
    override func setUp() {
        super.setUp()
        mockService = BreedsAPIServiceMock()
        sut = BreedListViewModel(apiService: mockService)
    }
    
    func testLoadBreeds_success() async {
        mockService.breeds = mockBreeds
        
        await sut.loadBreeds()
        
        XCTAssertEqual(sut.breeds.count, 3)
        XCTAssertEqual(sut.breeds[0].name, "labrador")
        XCTAssertFalse(sut.isLoading)
    }
    
    func testFilteredBreeds_withEmptySearchText_returnsAllBreeds() {
        sut.searchText = ""
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 3)
    }
    
    func testFilteredBreeds_withSearchText_returnsMatchingBreeds() {
        sut.searchText = "lab"
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 1)
    }
    
    func testFilteredBreeds_withSearchText_ignoresCase() {
        sut.searchText = "LAB"
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 1)
    }
    
    func testFilteredBreeds_withSearchText_matchesSubBreeds() {
        sut.searchText = "mini"
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 1)
    }
    
    func testFilteredBreeds_withSearchText_noMatches_returnsEmpty() {
        sut.searchText = "foo"
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 0)
    }
    
    func testFilteredBreeds_whenSearchTextChanges() {
        sut.searchText = "lab"
        sut.breeds = mockBreeds
        XCTAssertEqual(sut.filteredBreeds.count, 1)
        
        sut.searchText = "foo"
        XCTAssertEqual(sut.filteredBreeds.count, 0)
    }
    
}
