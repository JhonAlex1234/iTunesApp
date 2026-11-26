//
//  SongDetailView.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import SwiftUI

struct SongDetailView: View {
    let title: String
    let artist: String
    let genre: String
    let releaseDate: Date
    let album: String
    let duration: String
    let price: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image("MusicalIconGrey")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(maxWidth: 280)
                    .frame(maxWidth: .infinity)   // centra la carátula
                    .accessibilityHidden(true)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                    Text(artist)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                
                Grid(alignment: .leading) {
                    row("Género", genre)
                    Divider()
                    row("Lanzamiento", releaseDate.formatted(date: .abbreviated, time: .omitted))
                    Divider()
                    row("Álbum", album)
                    Divider()
                    row("Duración", duration)
                    Divider()
                    row("Precio", price)
                }
            }
            .scenePadding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func row(_ label: String, _ value: String) -> some View {
        GridRow {
            Text(label)
                .foregroundStyle(.secondary)
            Text(value)
                .fontWeight(.semibold)
        }
        .font(.subheadline)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    SongDetailView(
        title: "BESO",
        artist: "ROSALÍA & Rauw Alejandro",
        genre: "Pop latino",
        releaseDate: .now,
        album: "RR - Single",
        duration: "3:14",
        price: "1,29 USD"
    )
}
