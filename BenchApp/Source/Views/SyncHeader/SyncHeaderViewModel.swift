//
//  SyncHeaderViewModel.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-09-12.
//

import Foundation
import ComposableArchitecture

extension SyncHeaderView {
  struct State: Equatable {
    enum Status {
      case loading
      case error
      case success
    }
    
    var status: Status = .loading
    var lastUpdated = "10:30AM Sep 10 2020"
  }
  
  enum Action: Equatable {
    case tapped
    case status(State.Status)
  }
  
  struct Environment {
  }
  
  static let reducer = Reducer<State, Action, Environment> { state, action, environment in
    enum TimelineID {}
    switch action {
    case .tapped:
      return .init(value: .status(.loading))
    case .status(let status):
      state.status = status
      return .none
    }
  }
}
