//
//  Song.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import Foundation

struct Song: Identifiable, Decodable, Equatable{
    
    var id: Int
    private(set) var trackName: String
    private(set) var artistName: String
    private(set) var artworkUrl100: String
    private(set) var primaryGenreName: String
    private(set) var releaseDate: String
    private(set) var collectionName: String
    private(set) var trackTimeMillis: Int
    private(set) var trackPrice: Double
    private(set) var currency: String
    
    // Codificación para la API
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artworkUrl100
        case primaryGenreName
        case releaseDate
        case collectionName
        case trackTimeMillis
        case trackPrice
        case currency
    }
}
