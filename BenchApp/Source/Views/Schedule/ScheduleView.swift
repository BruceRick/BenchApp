//
//  ScheduleView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI
import ComposableArchitecture

struct ScheduleView: View {
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
      Text("Schedule")
      Spacer()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .navigationTitle("Schedule")
  }
}

struct ScheduleView_Previews: PreviewProvider {
  static var previews: some View {
    ScheduleView()
  }
}
