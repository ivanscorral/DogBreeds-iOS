//
//  BreedDetailViewModelTests.swift
//  DogBreeds-iOSTests
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import Foundation
import XCTest
@testable import DogBreeds_iOS

final class BreedDetailViewModelTests: XCTestCase {
    private var mockService: BreedsAPIServiceMock!
    private var sut: BreedDetailViewModel!
    
    override func setUp() {
        super.setUp()
        mockService = BreedsAPIServiceMock()
        sut = BreedDetailViewModel(breed: .mock1, apiService: mockService)
    }
    
    func testInitialState() {
        XCTAssertEqual(sut.name, "Labrador")
        XCTAssertEqual(sut.subBreeds, ["Golden", "Black"])
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.imageURL)
        XCTAssertNil(sut.errorMessage)
    }
    
    func testLoadImage_success_setsImageURL() async {
        let expectedURLString = "https://example.com/labrador.jpg"
        mockService.images = ["labrador": expectedURLString]
        
        await sut.loadImage()
        
        XCTAssertNotNil(sut.imageURL)
        XCTAssertEqual(sut.imageURL?.absoluteString, expectedURLString)
        XCTAssertNil(sut.errorMessage)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testLoadImage_withInvalidURL_setsError() async {
        mockService.images = ["labrador": ""]
        
        await sut.loadImage()
        
        XCTAssertNil(sut.imageURL)
        XCTAssertEqual(sut.errorMessage, "Error fetching image. Please try again")
        XCTAssertFalse(sut.isLoading)
    }
    
    func testLoadImage_whenServiceThrows_setsError() async {
        class FailingServiceMock: BreedAPIProtocol {
            func fetchBreeds() async throws -> [Breed] { [] }
            func fetchImageURL(for breedName: String) async throws -> String {
                throw URLError(.notConnectedToInternet)
            }
        }
        
        let failingService = FailingServiceMock()
        sut = BreedDetailViewModel(breed: .mock1, apiService: failingService)
        
        await sut.loadImage()
        
        XCTAssertNil(sut.imageURL)
        XCTAssertEqual(sut.errorMessage, "Error fetching image. Please try again")
        XCTAssertFalse(sut.isLoading)
    }
}
