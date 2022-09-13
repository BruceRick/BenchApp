//
//  MainView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI

struct MainView: View {
  let api: API.Type
  var body: some View {
    MainNavigationView(api: api)
      .onAppear {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
      }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(api: MockAPI.self)
  }
}
