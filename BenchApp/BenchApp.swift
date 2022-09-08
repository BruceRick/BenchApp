//
//  BenchApp.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI

@main
struct BenchApp: App {
  var body: some Scene {
    WindowGroup {
      MainView(api: api)
    }
  }
  
  var api: API.Type {
    if CommandLine.arguments.contains("testing") {
      // Would return a test api here
      return MockAPI.self
    } else {
      return MockAPI.self
    }
  }
}
