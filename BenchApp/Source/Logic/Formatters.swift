//
//  Formatters.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-09-07.
//

import Foundation

extension DateFormatter {
  static let gameTime: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    formatter.locale = .current
    return formatter
  }()
  
  static let gameWeekday: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    formatter.locale = .current
    return formatter
  }()
  
  static let gameDay: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd"
    formatter.locale = .current
    return formatter
  }()
}
