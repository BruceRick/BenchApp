//
//  MockAPI.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation
import Combine

struct MockAPI: API {
  static let baseURLString = "https://www.mockURL/"
  static let throttleDurationSeconds = 2
  
  static func request<T>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse) where T : Decodable {
    try await Task.sleep(nanoseconds: throttleDurationNanosecond)
    switch endpoint {
    case .timeline:
      return (Self.mockTimeline as! T, .init(url: URL(string: baseURLString + endpoint.path)!,
                                       mimeType: "mockMIME",
                                       expectedContentLength: 100,
                                       textEncodingName: "MockTextEndcoding"))
    }
  }
}

extension MockAPI {
  static var mockTimeline: Timeline {
    Timeline(games: [
      .init(id: 1,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 1,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted")
    ])
  }
}

extension MockAPI {
  static let nanosecondMultiplier = 1_000_000_000
  static var throttleDurationNanosecond: UInt64 { UInt64(throttleDurationSeconds * nanosecondMultiplier) }
}
