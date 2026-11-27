//
//  APIService.swift
//  ITunesApp
//
//  Created by JhonAlex1234 on 27/11/26.
//

import Foundation


struct APIService{
    static func fetchData<T: Decodable>(stringURL:String) async throws -> [T]{
        guard let url = URL(string: stringURL) else{
            throw APIError.invalidURL
        }
            
        do{
            let (data, response) = try await
            URLSession.shared.data(from:url)
            guard let responseHttp = response as? HTTPURLResponse,
                  (200...299).contains(responseHttp.statusCode)else{
                throw APIError.invalidResponse
            }
            
            let decodeResponse = try JSONDecoder().decode(ITunesResponse <T>.self, from: data)
            
            return decodeResponse.results
            
        }catch let error as APIError{
            throw error
            }
        catch let error as DecodingError{
                throw APIError.decoding(error)
            }
        catch{
            throw APIError.networkError(error)
            }
        }
    }
