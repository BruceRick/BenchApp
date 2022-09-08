//
//  TimelineGameView.swift
//  BenchApp
//
//  Created by Bruce Rick on 2022-08-30.
//

import SwiftUI

struct TimelineGameView: View {
  let game: Game
  
  var body: some View {
    HStack {
      time
      info
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 5)
  }
  
  var time: some View {
    VStack(spacing: 2) {
      Text(DateFormatter.gameTime.string(from: game.startDate))
      Text(DateFormatter.gameWeekday.string(from: game.startDate))
        .fontWeight(.bold)
      Text(DateFormatter.gameDay.string(from: game.startDate))
    }
    .padding(.trailing, 5)
  }
  
  var info: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(game.location)
        .fontWeight(.bold)
      addressButton
      Text(game.league)
      Text("Team: " + game.team + " | Position: " + game.position)
    }
    .padding(.leading, 5)
  }
  
  var addressButton: some View {
    Button {
      UIApplication.shared.open(URL(string: "http://maps.apple.com/?address=1701,WoodroffeAve.,Nepean,ON,K2G1W2")!)
    } label: {
      Text(game.address)
    }.lineLimit(1)
  }
  
  struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
      TimelineGameView(game: .init(
        id: 1,
        sport: "Hockey",
        location: "Nepean Sportsplex",
        address: "123 fake street",
        startDate: Date(timeIntervalSinceNow: -(60*60*5)),
        endDate: Date(timeIntervalSinceNow: -(60*60*5)),
        league: "Manshuns Hockey League",
        team: "Dark", position: "C", status: "Accepted"))
    }
  }
}
