//
//  ITunesResponse.swift
//  ITunesApp
//
//  Created by JhonAlex1234 on 27/11/26.
//

import Foundation

// Estructura del Objeto JSON de la respuesta de la API, ideada para funcionar tanto con canciones como para videoclips

struct ITunesResponse<T: Decodable>: Decodable {
    let resultCount: Int
    let results: [T]
}
