//
//  ErrorView.swift
//  DogBreeds-iOS
//
//  Created by Ivan Sanchez Corral on 3/6/25.
//

import SwiftUI

struct ErrorView: View {
     let error: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            Text("Oops! \(error)")
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    ErrorView(error: "MockError")
}
