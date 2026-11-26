//
//  MusicVideo.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import Foundation

struct MusicVideo: Identifiable {
    
    // Hace falta adaptarlas a la API
    var id: Int
    private(set) var trackName: String
    private(set) var artistName: String
    private(set) var artworkUrl100: String
    private(set) var primaryGenreName: String
    private(set) var releaseDate: String
    private(set) var trackTimeMillis: Int?
    private(set) var trackPrice: Double?
    private(set) var currency: String
    private(set) var previewUrl: String?

    
}
