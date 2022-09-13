//
//  SyncHeaderView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-09-12.
//

import SwiftUI
import ComposableArchitecture

struct SyncHeaderView: View {
  let store: Store<State, Action>
  typealias SyncHeaderViewStore = ViewStore<State, Action>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      ContentView(viewStore: viewStore)
    }
  }
}

extension SyncHeaderView {
  struct ContentView: View {
    let viewStore: SyncHeaderViewStore
    
    var body: some View {
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(maxHeight: .infinity)
          .foregroundColor(viewStore.status.color)
        Button {
          viewStore.send(.tapped)
        } label: {
          if viewStore.status == .loading {
            ProgressView()
              .padding(.trailing, 5)
              .tint(.white)
          } else {
            Image(systemName: "arrow.triangle.2.circlepath")
              .padding(.trailing, 5)
          }
          Text("Last updated on: ")
          Text(viewStore.lastUpdated)
        }
        .padding(10)
        .foregroundColor(.white)
      }
      .frame(height: 44)
    }
  }
}

extension SyncHeaderView.State.Status {
  var color: Color {
    switch self {
    case .loading:
      return .orange
    case .success:
      return .green
    case .error:
      return .red
    }
  }
}

struct SyncHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    SyncHeaderView(store: Store(
      initialState: .init(),
        reducer: SyncHeaderView.reducer,
        environment: .init()
    ))
  }
}
