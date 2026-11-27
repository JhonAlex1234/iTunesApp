//
//  APIError.swift
//  ITunesApp
//
//  Created by JhonAlex1234 on 27/11/26.
//

import Foundation

// API errors genéricos

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The URL is invalid"
        case .invalidResponse: return "Invalid response from server"
        case .decoding(let error): return "Failed to decode response:\(error.localizedDescription)"
        case .networkError(let error): return "Network error: \(error.localizedDescription)"
        }
    }
}
