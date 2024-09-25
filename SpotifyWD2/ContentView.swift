//
//  ContentView.swift
//  SpotifyWD2
//
//  Created by Teresa Akinbodun
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer().frame(height: 8) // Set a fixed height for spacing
            Text("Hello, BC NY!")
        }
        .padding()
    }
}

struct ColorItem {
    let name: String
    let color: Color
}

struct spotifyWidget: View {
    
    
    
    let colors: [ColorItem] = [
        ColorItem(name: "Yugi", color: .blue),
        ColorItem(name: "Kaiba", color: .red),
        ColorItem(name: "Joey", color: .yellow),


    ]
    
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 155, height: 155)
                .overlay(
                    GeometryReader { geometry in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(colors, id: \.name) { item in
                                    VStack {
                                        Circle()
                                            .fill(item.color)
                                             .frame(width: 60, height: 60)
                                             .padding(.top, 77)
                                         Text(item.name)
                                             .font(.caption)
                                             .foregroundColor(.white)
                                         
                                    }
 
                                }
                            }
                            .padding(.horizontal, (geometry.size.width - 60 * CGFloat(colors.count) - 20 * CGFloat(colors.count - 1)) / 2) // Centering padding

                        }
                        .frame(height: 77)
                        
                    }
                )
                .padding()

        }
    }
}


#Preview {
    ContentView()
    spotifyWidget()
}
