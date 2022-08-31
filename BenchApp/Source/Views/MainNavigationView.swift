//
//  MainNavigationView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI

struct MainNavigationView: View {
  
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
    
    @ViewBuilder
    var view: some View {
      switch self {
      default:
        TimelineView()
      }
    }
  }
  
  var body: some View {
    NavigationView {
      TabView {
        ForEach(Tab.allCases) { tab in
          tab.view
            .navigationTitle(tab.rawValue)
            .tabItem {
              Label(tab.rawValue, systemImage: tab.iconName)
            }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct MainNavigationView_Previews: PreviewProvider {
  static var previews: some View {
    MainNavigationView()
  }
}
