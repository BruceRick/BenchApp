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
            location: "Nepean Sportsplex Arena 2",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: (60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 2,
            sport: "Hockey",
            location: "Nepean Sportsplex Arena 2",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: (60*60*6)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 3,
            sport: "Hockey",
            location: "Bell Sensplex",
            address: "1565 Maple Grove Rd, Kanata, ON K2V 1A3",
            startDate: Date(timeIntervalSinceNow: (60*60*24*2)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Ottawa Hockey League",
            team: "Dark",
            position: "D",
            status: "Accepted"),
      .init(id: 4,
            sport: "Hockey",
            location: "Kanata Recreational Complex",
            address: "100 Charlie Rogers Pl, Kanata, ON K2V 1A2",
            startDate: Date(timeIntervalSinceNow: (60*60*24*3)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Ottawa Hockey League",
            team: "Dark",
            position: "W",
            status: "Accepted"),
      .init(id: 5,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 6,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 7,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 8,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 9,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 10,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 11,
            sport: "Hockey",
            location: "Nepean Sportsplex",
            address: "1701 Woodroffe Ave, Nepean, ON K2G 1W2",
            startDate: Date(timeIntervalSinceNow: -(60*60*5)),
            endDate: Date(timeIntervalSinceNow: -(60*60*5)),
            league: "Manshuns Hockey League",
            team: "Dark",
            position: "C",
            status: "Accepted"),
      .init(id: 12,
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
