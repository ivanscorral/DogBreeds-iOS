//
//  BreedListView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedListView: View {
    @State private var viewModel = BreedListViewModel()

    var body: some View {
        NavigationSplitView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading breeds...")
                        .transition(.opacity)
                } else {
                    List(viewModel.filteredBreeds) { breed in
                        NavigationLink {
                            BreedDetailView(breed: breed)
                        } label: {
                            BreedRow(breed: breed)
                        }
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
        } detail: {
            Text("Select a breed")
        }
    }
}

#Preview {
    BreedListView()
}
