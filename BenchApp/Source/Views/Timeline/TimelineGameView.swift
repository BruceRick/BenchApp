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
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray5), lineWidth: 2)
    )
    .cornerRadius(10.0)
  }
  
  var time: some View {
    VStack(spacing: 2) {
      Text(DateFormatter.gameTime.string(from: game.startDate))
      Text(DateFormatter.gameWeekday.string(from: game.startDate).uppercased())
        .font(.title2)
        .fontWeight(.bold)
      Text(DateFormatter.gameDay.string(from: game.startDate))
        .fontWeight(.light)
    }
    .frame(width: 80)
    .frame(maxHeight: .infinity)
    .padding(10)
    .background(Color(.systemGray6))
  }
  
  var info: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(game.location)
        .fontWeight(.bold)
      Text(game.league)
        .fontWeight(.light)
      Text("Team: " + game.team + " | Position: " + game.position)
      addressButton
    }
    .padding(10)
  }
  
  var addressButton: some View {
    Button {
      UIApplication.shared.open(URL(string: "http://maps.apple.com/?address=1701,WoodroffeAve.,Nepean,ON,K2G1W2")!)
    } label: {
      HStack(spacing: 5) {
        Image(systemName: "mappin.circle.fill")
        Text(game.address)
      }
      .padding(2)
    }
    .lineLimit(1)
    .padding(.trailing, 10)
    .background(.blue)
    .foregroundColor(.white)
    .cornerRadius(20)
    .padding(.top, 5)
  }
  
  struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
      TimelineGameView(game: .init(
        id: 1,
        sport: "Hockey",
        location: "Nepean Sportsplex",
        address: "123 fake street, city, province, postal code",
        startDate: Date(timeIntervalSinceNow: -(60*60*5)),
        endDate: Date(timeIntervalSinceNow: -(60*60*5)),
        league: "Manshuns Hockey League",
        team: "Dark", position: "C", status: "Accepted"))
      .frame(height: 130)
    }
  }
}
