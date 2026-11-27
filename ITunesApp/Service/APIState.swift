//
//  APIState.swift
//  ITunesApp
//
//  Created by JhonAlex1234 on 27/11/26.
//

enum APIState<T: Equatable>: Equatable {
    case idle
    case loading
    case loaded([T])
    case empty
    case error(String)
}
