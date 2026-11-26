//
//  MusicVideosView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct MusicVideosView: View {

    // Variable para buscar hay que acabar de configurarla
    @State private var searchText: String = ""

    // Variable para los vídeos musicales
    @Environment(MusicStore.self) private var store

    let title: String

    var body: some View {

        Group {

            if store.musicVideos.isEmpty {

                SearchStateComponent(
                    icon: "play.rectangle",
                    title: "Type to search",
                    message: "Search by title or artist, then tap Search."
                )

            } else {

                List(store.musicVideos) { video in

                    MusicVideoRowComponent(
                        trackName: video.trackName,
                        artistName: video.artistName,
                        trackTimeMillis: video.trackTimeMillis
                    )

                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search by title or artist"
        )
    }
}

#Preview {
    NavigationStack {
        MusicVideosView(title: "Music Videos")
    }
    .environment(MusicStore())
}
