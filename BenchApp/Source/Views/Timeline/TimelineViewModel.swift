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
    var sync = SyncHeaderView.State()
  }
  
  enum Action: Equatable {
    case loadTimeline
    case loadSuccess(Timeline)
    case error
    case sync(SyncHeaderView.Action)
  }
  
  struct Environment {
    let api: API.Type
  }
  
  static let reducer = Reducer<State, Action, Environment>.combine(
    .init { state, action, environment in
      enum TimelineID {}
      switch action {
      case .loadTimeline:
        return .task {
          let data: Timeline = try await environment.api.request(endpoint: .timeline).data
          return .loadSuccess(data)
        } catch: { _ in
            .error
        }
        .cancellable(id: TimelineID.self)
      case .loadSuccess(let timeline):
        state.sync.status = .success
        state.timeline = timeline
        return .init(value: .sync(.status(.success)))
      case .sync(.tapped):
        return .init(value: .loadTimeline)
      case .error:
        state.sync.status = .error
        return .init(value: .sync(.status(.error)))
      case .sync:
        return .none
      }
    },
    SyncHeaderView.reducer
      .pullback(state: \.sync,
                action: /Self.Action.sync,
                environment: { _ in .init() })
  )
}
