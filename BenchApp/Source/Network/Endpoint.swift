//
//  Endpoint.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation

enum Endpoint {
  case timeline
  
  var path: String {
    switch self {
    case .timeline:
      return "timeline"
    }
  }
}
