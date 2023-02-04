//
//  RMService.swift
//  RickAndMorty
//
//  Created by user on 03.02.2023.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singlet in instance
    static let shared = RMService()
    
    private init() {}/// Privatized constructor
    
    /// Send Rick and Morty API call
    ///  - request: Request instance
    ///  -completion: callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            
        }
}
