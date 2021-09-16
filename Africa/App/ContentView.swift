//
//  ContentView.swift
//  Africa
//
//  Created by Muhammad Usman on 14/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive = false
    @State private var gridlayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon = "square.grid.2x2"
    
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    // MARK: Functions
    func switchGrid(){
        gridlayout = Array(repeating: .init(.flexible()), count: gridlayout.count%3+1)
        gridColumn = gridlayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView{
            Group {
                if !isGridViewActive
                {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0    ))
                        
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } // Link
                        } // Loop
                    } // List
                }else{
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(columns: gridlayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridViewItem(animal: animal)
                                }
                            }
                        }// Grid
                    }// Scroll
                } // Condition
            } // Group
            .animation(.easeIn)
            .navigationBarTitle("Africa")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })// Button
                        
                        Button(action: {
                            switchGrid()
                            isGridViewActive = true
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }) // Button
                    } // HStack
                }// Item
            } // Toolbar
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
