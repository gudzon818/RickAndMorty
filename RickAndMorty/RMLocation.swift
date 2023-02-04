//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by user on 03.02.2023.
//

import Foundation

struct RMLocation: Codable {
  
          let id: String
          let name: String
          let type: String
          let dimension: String
          let residents: [String]
          let url: String
          let created: String
      
}

