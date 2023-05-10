//
//  ContentView.swift
//  Africa
//
//  Created by Eric Burrell on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridColumn = gridColumn % 3 + 1
        gridLayout = Array(repeating: .init(.flexible()), count: gridColumn)
        print("Grid Number: \(gridColumn)")
        
        // TOOLBAR IMAGE
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
    
    func switchBack() {
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
            gridColumn = 3
        case 2:
            toolbarIcon = "square.grid.2x2"
            gridColumn -= 1
        case 3:
            toolbarIcon = "square.grid.3x2"
            gridColumn -= 1
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                // MARK: - LIST VIEW
                if !isGridViewActive {
                    List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalListItemView(animal: item)
                                } //: LINK
                            } //: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    } //: LIST
                    // MARK: - GRID VIEW
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridItemView(animal: item)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                        .animation(.easeIn, value: gridLayout.count)
                    } //: SCROLL
                } //: IF-ELSE
            } //: GROUP
                .navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
            // MARK: - TOOLBAR/BUTTONS
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            // MARK: - LIST BUTTON
                            Button(action: {
                                print("List View Active")
                                if isGridViewActive {
                                    switchBack()
                                }
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            
                            // MARK: - GRID BUTTON
                            Button(action: {
                                print("Grid View Active")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            }) {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        } //: HSTACK
                    }
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

    //MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
