//
//  SongsView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct SongsView: View {

    // Variable para buscar canciones
    @State private var searchText: String = ""

    // ViewModel de la música
    @Environment(MusicStore.self) private var store

    let title: String

    var body: some View {

        Group {

            switch store.songsState {

            case .idle:

                SearchStateComponent(
                    icon: "music.note",
                    title: "Type to search",
                    message: "Search by title or artist, then tap Search."
                )

            case .loading:

                SearchStateComponent(
                    icon: "music.note",
                    title: "Loading",
                    message: "Searching for songs...",
                    isLoading: true
                )

            case .loaded(let songs):

                List(songs) { song in

                    NavigationLink(
                        destination: SongDetailView(song: song)
                    ) {

                        MusicRowComponent(
                            trackName: song.trackName,
                            artistName: song.artistName,
                            secondaryText: song.collectionName
                        )
                    }
                }

            case .empty:

                SearchStateComponent(
                    icon: "magnifyingglass",
                    title: "No results found",
                    message: "Try searching for another song or artist."
                )

            case .error(let message):

                SearchStateComponent(
                    icon: "exclamationmark.triangle",
                    title: "Error",
                    message: message,
                    buttonTitle: "Try again",
                    action: {
                        store.getSongs(searchText)
                    }
                )
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search by title or artist"
        )
        .onSubmit(of: .search) {
            store.getSongs(searchText)
        }
    }
}

#Preview {

    NavigationStack {
        SongsView(title: "Songs")
    }
    .environment(MusicStore())
}
