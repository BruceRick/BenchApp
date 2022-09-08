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
    NavigationView {
      TabView {
        ForEach(Tab.allCases) { tab in
          TimelineView(store: Store(
            initialState: .init(),
            reducer: TimelineView.reducer,
            environment: .init(api: api))
          )
            .navigationTitle(tab.rawValue)
            .tabItem {
              Label(tab.rawValue, systemImage: tab.iconName)
            }
        }
      }.navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct MainNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    MainNavigationView(api: MockAPI.self)
  }
}
