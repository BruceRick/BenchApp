//
//  TimelineViewModel.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation
import ComposableArchitecture

extension TimelineView {
  struct State: Equatable {
    var timeline: Timeline?
  }
  
  enum Action: Equatable {
    case onAppear
    case loadTimeline(Timeline)
    case error
  }
  
  struct Environment {
    let api: API.Type
  }
  
  static let reducer = Reducer<State, Action, Environment> { state, action, environment in
    enum TimelineID {}
    switch action {
    case .onAppear:
      return .task {
        let data: Timeline = try await environment.api.request(endpoint: .timeline).data
        return .loadTimeline(data)
      } catch: { _ in
          .error
      }
      .cancellable(id: TimelineID.self)
    case .loadTimeline(let timeline):
      state.timeline = timeline
      return .none
    case .error:
      return .none
    }
  }
}
