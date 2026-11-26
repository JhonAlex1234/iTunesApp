//
//  SongsView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct SongsView: View {

    // Variable para buscar hay que acabar de configurarla
    @State private var searchText: String = ""

    // Variable para la musica
    @Environment(MusicStore.self) private var store

    let title: String

    var body: some View {
        
        Group {
            
            if store.songs.isEmpty {
                
                VStack {
                    
                    Image(systemName: "music.note")
                        .font(.largeTitle)
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 60, height: 60)
                        .background(Color.accentColor.opacity(0.20), in: Circle())
                    
                    Text("«Type to search»")
                        .font(.largeTitle)
                    
                    Text("Search by title or artist, then tap Search.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
            } else {
                
                List(store.songs) { song in
                    NavigationLink(destination: SongDetailView(song: song)) {
                        
                        MusicRowComponent(
                            trackName: song.trackName,
                            artistName: song.artistName,
                            secondaryText: song.collectionName
                        )
                        
                    }
                    
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by title or artist")
        
    }
}

#Preview {
    NavigationStack {
        SongsView(title: "Songs")
    }
    .environment(MusicStore())
}
