# DogBreeds-iOS

DogBreeds-iOS is a simple SwiftUI app that displays a list of dog breeds using data from the Dog CEO API. Users can browse breeds, search by name, and view details, with random images in a modal presentation.

## 📦 Project Structure

- Models: Codable structs for API decoding (`Breed`, `BreedsResponse`, etc.)
- Networking: API service and protocol abstraction (`BreedsAPIService`, `BreedAPIProtocol`)
- ViewModels: SwiftUI-compatible logic for state management (`BreedListViewModel`, `BreedDetailViewModel`)
- Views: All SwiftUI components and screens
- Mocks: Static mock data and mock services for previews
- DogBreeds-iOSTests: Unit tests for view models using a mock API service

## 🧱 Architecture

The app follows the MVVM pattern with a clear separation between data, logic, and UI. Dependency injection is used to facilitate testing and previews.
