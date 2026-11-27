//
//  MusicStore.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import Observation
import Foundation

@Observable
class MusicStore {

    private(set) var songsState: APIState<Song> = .idle
    private(set) var musicVideos: [MusicVideo] = []

    func getSongs(_ searchText: String) {

        let trimmedText = searchText.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard trimmedText.isEmpty == false else {
            songsState = .idle
            return
        }

        songsState = .loading

        Task {
            do {
                let songs = try await APIService.fetchSongs(
                    searchText: trimmedText
                )

                if songs.isEmpty {
                    songsState = .empty
                } else {
                    songsState = .loaded(songs)
                }

            } catch {
                songsState = .error(error.localizedDescription)
            }
        }
    }
}
