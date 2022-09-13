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
      NavigationView {
        VStack(spacing: 0) {
          ScrollView {
            LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
              Section(header: header) {
                ForEach(viewStore.timeline?.games ?? [], id: \.id) { game in
                  TimelineGameView(game: game)
                }
                .padding(.horizontal, 8)
              }
            }
            .padding(.bottom, 10)
          }
        }
        .onAppear {
          viewStore.send(.loadTimeline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Upcoming Games")
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
  
  var header: some View {
    SyncHeaderView(store: self.store.scope(
      state: \.sync,
      action: Action.sync
    ))
  }
}

struct TimelineView_Previews: PreviewProvider {
  static var previews: some View {
    TimelineView(store: Store(
      initialState: .init(timeline: MockAPI.mockTimeline),
        reducer: TimelineView.reducer,
        environment: .init(api: MockAPI.self)
    ))
  }
}
