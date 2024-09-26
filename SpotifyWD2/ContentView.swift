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
            Text("Hello, Teresa!").fontWeight(.semibold)
            
        }
        .padding()
    }
}

struct ColorItem: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}


// let this be for the small widget

struct spotifyWidget: View {
    @State private var activeIndex: Int = 0
    
    let colors: [ColorItem] = [
        ColorItem(name: "Yugi", color: .blue),
        ColorItem(name: "Kaiba", color: .red),
        ColorItem(name: "Joey", color: .yellow),
    ]
    
    var body: some View {
        Text("Small Widget")
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 155, height: 155)
                .overlay(
                    GeometryReader { geometry in
                        ScrollViewReader { scrollView in
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 26) {
                                    ForEach(Array(colors.enumerated()), id: \.element.id) { index, item in
                                        VStack {
                                            Circle()
                                                .fill(item.color)
                                                .frame(width: activeIndex == index ? 62 : 40, height: activeIndex == index ? 62 : 40)
                                                .padding(.top, 77)
                                            Text(item.name)
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        .id(index)
                                        .onTapGesture {
                                            withAnimation {
                                                activeIndex = index
                                                scrollView.scrollTo(index, anchor: .center)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, (geometry.size.width - 60) / 2)
                            }
                            .frame(height: 77)
                            .onAppear {
                                scrollView.scrollTo(activeIndex, anchor: .center)
                            }
                        }
                    }
                )
                .padding()
        }
    }
}




// let this be for the medium sized widget
struct spotifyWidgetM: View {

    @State private var activeIndex: Int = 0
    
    let colors: [ColorItem] = [
        ColorItem(name: "Yugi", color: .blue),
        ColorItem(name: "Kaiba", color: .red),
        ColorItem(name: "Joey", color: .yellow),
        ColorItem(name: "Tea", color: .pink),
        ColorItem(name: "Tristan", color: .green),

    ]
    
    var body: some View {
        Text("Medium Widget")
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
                .frame(width: 329, height: 155)
                .overlay(
                    GeometryReader { geometry in
                        ScrollViewReader { scrollView in
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 26) {
                                    ForEach(Array(colors.enumerated()), id: \.element.id) { index, item in
                                        VStack {
                                            Circle()
                                                .fill(item.color)
                                                .frame(width: activeIndex == index ? 80 : 60, height: activeIndex == index ? 80 : 60)
                                                .padding(.top, 77)
                                            Text(item.name)
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        .id(index)
                                        .onTapGesture {
                                            withAnimation {
                                                activeIndex = index
                                                scrollView.scrollTo(index, anchor: .center)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 50) // need to play around with the horizontal padding
                            }
                            .frame(height: 77)
                            .onAppear {
                                scrollView.scrollTo(activeIndex, anchor: .center)
                            }
                        }
                    }
                )
                .padding()
        }
    }
}




#Preview {
    ContentView()
    spotifyWidget()
    spotifyWidgetM()
}
