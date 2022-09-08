//
//  BenchAppUITests.swift
//  BenchAppUITests
//
//  Created by Bruce Rick on 2022-08-30.
//

import XCTest

//struct UITestAPI: API {
//  static let baseURLString = "https://www.mockURL/"
//
//  static func request<T>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse) where T : Decodable {
//    switch endpoint {
//    case .timeline:
//      return (Self.testTimeline as! T, .init(url: URL(string: baseURLString + endpoint.path)!,
//                                       mimeType: "mockMIME",
//                                       expectedContentLength: 100,
//                                       textEncodingName: "MockTextEndcoding"))
//    }
//  }
//
//  static var testTimeline: Timeline {
//    .init(games: [
//      testGame
//    ])
//  }
//
//  static var testGame: Game = .init(id: 1,
//                                    sport: "Test Sport",
//                                    location: "Test Location",
//                                    address: "Test Address",
//                                    startDate: Date(),
//                                    endDate: Date(),
//                                    league: "Test League",
//                                    team: "Test Team",
//                                    position: "Test Position",
//                                    status: "Test Status")
//}


class BenchAppUITests: XCTestCase {
  func test() throws {
    let app = XCUIApplication()
    app.launchArguments = ["testing"]
    app.launch()

    // Perform tests here
  }
}
