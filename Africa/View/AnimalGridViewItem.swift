//
//  AnimalGridViewItem.swift
//  Africa
//
//  Created by Muhammad Usman on 16/09/2021.
//

import SwiftUI

struct AnimalGridViewItem: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
    }
}

struct AnimalGridViewItem_Previews: PreviewProvider {
    static var animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridViewItem(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
