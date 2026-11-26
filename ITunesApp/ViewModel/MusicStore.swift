//
//  MusicStore.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import Observation

@Observable
class MusicStore {
    
    private(set) var songs: [Song] = [
        Song(
                trackId: 1676343411,
                trackName: "BESO",
                artistName: "ROSALÍA & Rauw Alejandro",
                artworkUrl100: "",
                primaryGenreName: "Pop Latino",
                releaseDate: "2023-03-24T12:00:00Z",
                collectionName: "RR - Single",
                trackTimeMillis: 194543,
                trackPrice: 1.29,
                currency: "USD"
            )
    ]
    private(set) var musicVideos: [MusicVideo] = []
    
    
    // Poner funciones intent
}
