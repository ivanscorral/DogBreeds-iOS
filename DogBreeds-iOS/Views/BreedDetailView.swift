//
//  BreedDetailView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    enum ViewTraits {
        static let imageCornerRadius: CGFloat = 12
        static let spacing: CGFloat = 16
    }
    
    @State var breedDetailViewModel: BreedDetailViewModel
    
    init(viewModel: BreedDetailViewModel) {
        _breedDetailViewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let errorMessage = breedDetailViewModel.errorMessage {
                    ErrorView(error: errorMessage)
                } else if let url = breedDetailViewModel.imageURL {
                    VStack(alignment: .leading, spacing: ViewTraits.spacing) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(ViewTraits.imageCornerRadius)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: .infinity)
                        Text(breedDetailViewModel.name)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        PlaceholderText()
                        Spacer()
                    }
                    .padding()
                    
                } else {
                    ProgressView("Loading image...")
                }
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    BackButton(title: "List") {
                        dismiss()
                    }
                }
            }
        }
        .task {
            await breedDetailViewModel.loadImage()
        }
    }
}
#Preview {
    BreedDetailView(viewModel: .init(breed: .mock1))
}
