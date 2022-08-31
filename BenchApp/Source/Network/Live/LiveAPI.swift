//
//  LiveAPI.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation

struct LiveAPI: API {
  static let baseURLString = "insert live api url here"
  static let jsonDecoder: JSONDecoder = {
    var decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }()
  
  enum APIError: Error {
    case invalidURL
  }
  
  static func request<T>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse) where T : Decodable {
    guard let url = URL(string: Self.baseURLString.appending(endpoint.path)) else {
      throw APIError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    let decodedData = try jsonDecoder.decode(T.self, from: data)
    return (decodedData, response)
  }
}
