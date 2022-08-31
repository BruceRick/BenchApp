//
//  MockAPI.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation

struct MockAPI: API {
  static func request<T>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse) where T : Decodable {
    switch endpoint {
    case .timeline:
      return (Self.mockTimeline as! T, .init(url: URL(string: "https://www.mockURL/".appending(endpoint.path))!,
                                       mimeType: "mockMIME",
                                       expectedContentLength: 100,
                                       textEncodingName: "MockTextEndcoding"))
    }
  }
}

extension MockAPI {
  static var mockTimeline: Timeline {
    Timeline(games: [])
  }
}
