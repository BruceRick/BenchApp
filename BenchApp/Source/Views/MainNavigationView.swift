//
//  MainNavigationView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI
import ComposableArchitecture

struct MainNavigationView: View {
  let api: API.Type
  
  enum Tab: String, CaseIterable, Identifiable {
    case Home
    case Schedule
    case Finder
    case Chatter
    case Leagues
    case Profile
    case Payments
    case Notifications

    
    var id: String {
      rawValue
    }
    
    var iconName: String {
      switch self {
      case .Home: return "house"
      case .Schedule: return "calendar"
      case .Finder: return "magnifyingglass"
      case .Chatter: return "text.bubble.fill"
      case .Leagues: return "tshirt.fill"
      case .Profile: return "person.crop.circle.fill"
      case .Payments: return "dollarsign.circle.fill"
      case .Notifications: return "bell.fill"
      }
    }
  }
  
  var body: some View {
    TabView {
      ForEach(Tab.allCases) { tab in
        view(tab: tab)
          .tabItem {
            Label(tab.rawValue, systemImage: tab.iconName)
          }
      }
    }
  }
  
  @ViewBuilder
  func view(tab: Tab) -> some View {
    switch tab {
    case .Home:
      TimelineView(store: Store(
        initialState: .init(sync: .init()),
        reducer: TimelineView.reducer,
        environment: .init(api: api))
      )
    default:
      NavigationView {
        VStack(spacing: 0) {
          Spacer()
          Text(tab.rawValue)
          Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(tab.rawValue)
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct MainNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    MainNavigationView(api: MockAPI.self)
  }
}
