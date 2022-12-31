//
//  Standings.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/23/22.
//

import Foundation

struct Standings: Decodable {
    
    var teamID: Int
    var key: String { didSet { logo = setTeamLogo(from: key)}}
    let city: String
    let name: String
    var logo: String = ""
    let conference: String
    var wins: Int
    var losses: Int
    var ranking: Int = 0
    
    
    enum CodingKeys: String, CodingKey {
        case ranking, logo
        case teamID     = "TeamID"
        case key        = "Key"
        case city       = "City"
        case name       = "Name"
        case conference = "Conference"
        case wins       = "Wins"
        case losses     = "Losses"
    }
    
}

extension Standings {
    
    /// return the team logo url based on the team name
    func setTeamLogo(from teamName: String) -> String {
        switch teamName {
        // case for each team logo return string svg
        default:
            print("error")
            return "error"
        }
    }
}
