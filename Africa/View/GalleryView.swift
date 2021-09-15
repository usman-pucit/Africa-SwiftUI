//
//  GalleryView.swift
//  Africa
//
//  Created by Muhammad Usman on 14/09/2021.
//

import SwiftUI

struct GalleryView: View {
    
    var animals: [Animal] = Bundle.main.decode("animals.json")
    private var heptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal = "lion"
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
        
    func switchColumn(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 30){
                
                // Header Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        heptic.impactOccurred()
                        switchColumn()
                    })
                
                // Grid
                LazyVGrid(columns: gridLayout, spacing: 10){
                    ForEach(animals, id: \.id){ animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                heptic.impactOccurred()
                                selectedAnimal = animal.image
                            }
                    }
                }
                .animation(.easeIn)
            }
        }
        .onAppear(perform: {
            switchColumn()
        })
        .background(MotionAnimationView())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
