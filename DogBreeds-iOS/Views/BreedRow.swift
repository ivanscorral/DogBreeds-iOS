//
//  BreedRow.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 2/6/25.
//

import SwiftUI

struct BreedRow: View {
    var breed: Breed
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(breed.fullName)
            }
            Spacer()
        }
    }
}

#Preview {
    let breeds: [Breed] = .mock
    Group {
        BreedRow(breed: breeds[0])
        BreedRow(breed: breeds[1])
        BreedRow(breed: breeds[2])
    }
}
