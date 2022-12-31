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

struct GameByDate: Decodable {
    
    var gameID: Int
    
    var homeTeam: String { didSet { homeTeamLogo = setTeamLogo(from: homeTeam)} }
    var homeTeamLogo: String = ""
    let homeTeamScore: Int?
    
    var awayTeam: String { didSet { awayTeamLogo = setTeamLogo(from: awayTeam)} }
    var awayTeamLogo: String = ""
    let awayTeamScore: Int?
    
    let status: String
    var dateTime: String
    
    enum CodingKeys: String, CodingKey {
        case gameID, homeTeamLogo, awayTeamLogo
        case homeTeam       = "HomeTeam"
        case homeTeamScore  = "HomeTeamScore"
        case awayTeam       = "AwayTeam"
        case awayTeamScore  = "AwayTeamScore"
        case status         = "Status"
        case dateTime       = "DateTime"
    }
    
}

extension GameByDate {
    
    /// return the team logo url based on the team name
    func setTeamLogo(from teamName: String) -> String {
        switch teamName {
        //case for each team logo return string svg
        default:
            print("error")
            return "error"
        }
    }
}
