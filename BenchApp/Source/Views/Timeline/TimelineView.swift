//
//  TimelineView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI
import ComposableArchitecture

struct TimelineView: View {
  let store: Store<State, Action>
  typealias TimelineViewStore = ViewStore<State, Action>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      ContentView(viewStore: viewStore)
        .navigationTitle("Upcoming Games")
    }
  }
}

extension TimelineView {
  struct ContentView: View {
    let viewStore: TimelineViewStore
    
    var body: some View {
      List(viewStore.timeline?.games ?? [], id: \.id) { game in
        TimelineGameView(game: game)
      }.onAppear {
        viewStore.send(.onAppear)
      }
      .background(Color.init(white: 0.9))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

struct TimelineView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineView(store: Store(
        initialState: .init(),
        reducer: TimelineView.reducer,
        environment: .init(api: MockAPI.self)
    ))
  }
}
