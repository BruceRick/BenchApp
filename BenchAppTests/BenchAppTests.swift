//
//  BenchAppTests.swift
//  BenchAppTests
//
//  Created by Bruce Rick on 2022-08-30.
//

import ComposableArchitecture
import XCTest

@testable import BenchApp

struct TestAPI: API {
  static let baseURLString = "https://www.mockURL/"
  
  static func request<T>(endpoint: Endpoint) async throws -> (data: T, response: URLResponse) where T : Decodable {
    switch endpoint {
    case .timeline:
      return (Self.testTimeline as! T, .init(url: URL(string: baseURLString + endpoint.path)!,
                                       mimeType: "mockMIME",
                                       expectedContentLength: 100,
                                       textEncodingName: "MockTextEndcoding"))
    }
  }
  
  static var testTimeline: Timeline {
    .init(games: [
      testGame
    ])
  }
  
  static var testGame: Game = .init(id: 1,
                                    sport: "Test Sport",
                                    location: "Test Location",
                                    address: "Test Address",
                                    startDate: Date(),
                                    endDate: Date(),
                                    league: "Test League",
                                    team: "Test Team",
                                    position: "Test Position",
                                    status: "Test Status")
}

class BenchAppTests: XCTestCase {
  func testListAdd() async {
    let store = TestStore(
      initialState: TimelineView.State(),
      reducer: TimelineView.reducer,
      environment: .init(api: TestAPI.self)
    )
      
    await store.send(.onAppear)
      
    await store.receive(.loadTimeline(TestAPI.testTimeline)) {
      $0.timeline = TestAPI.testTimeline
    }
  }
}
