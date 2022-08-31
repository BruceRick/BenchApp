//
//  Game.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import Foundation

struct Game: Decodable {
  let sport: String
  let location: String
  let address: String
  let startDate: Date
  let endDate: Date
  let league: String
  let team: String
  let position: String
  let status: String
}
