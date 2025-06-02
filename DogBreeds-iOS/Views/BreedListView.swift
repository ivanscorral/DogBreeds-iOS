//
//  BreedListView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedListView: View {
    @State private var viewModel = BreedListViewModel()
    @State private var selectedBreed: Breed?

      var body: some View {
          NavigationStack {
              Group {
                  if viewModel.isLoading {
                      ProgressView("Loading breeds...")
                          .frame(maxWidth: .infinity, maxHeight: .infinity)
                          .transition(.opacity)
                  } else {
                      List(viewModel.filteredBreeds) { breed in
                          Button {
                              selectedBreed = breed
                          } label: {
                              BreedRow(breed: breed)
                          }
                          .buttonStyle(.plain)
                      }
                      .transition(.opacity)
                  }
              }
              .navigationTitle("Breeds")
              .searchable(text: $viewModel.searchText)
              .task {
                  await viewModel.loadBreeds()
              }
              .animation(.easeInOut, value: viewModel.isLoading)
          }
          .sheet(item: $selectedBreed) { breed in
              BreedDetailView(breed: breed)
          }
      }
  }

  #Preview {
      BreedListView()
  }
