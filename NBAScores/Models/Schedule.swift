//
//  GameByDate.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/19/22.
//


 
import Foundation

// Our data model will reflect what data we want from the JSON recieved on GamesByDate endpoint.
// This information will be displayed on our scoreboards as cards (collection view cells)

// Home Team : Name, logo, score?
// Away Team: Name, logo, score?
// Status
// Date & Time

struct Schedule: Codable {
    var games:[Game]
    
    init() {
        self.games = [Game]()
    }
}



struct Game: Codable, Identifiable {
    
    var id:UUID? = UUID()
    var GameID: Int
    var Status:String
    var DateTime:String
    var AwayTeam:String
    var HomeTeam:String
    var AwayTeamID:Int
    var HomeTeamID:Int
    var AwayTeamScore:Int?
    var HomeTeamScore:Int?
    
    // Initialized to default values, overwritten in JSON parsing
    init(gameid:Int, status:String, time:String, away:String, home:String, awayID:Int, homeID:Int,
         awayScore:Int, homeScore:Int) {
        self.id = UUID()
        self.GameID = gameid
        self.Status = status
        self.DateTime = time
        self.AwayTeam = away
        self.HomeTeam = home
        self.AwayTeamID = awayID
        self.HomeTeamID = homeID
        self.AwayTeamScore = awayScore
        self.HomeTeamScore = homeScore
    }
    
}

