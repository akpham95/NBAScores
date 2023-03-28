//
//  NSStandingsTableViewCellViewModel.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/18/23.
//

import Foundation

final class NSStandingsTableViewCellViewModel {
    
    public let teamID: Int
    public let key:String
    public let city:String
    public let name:String
    public let conference:String
    public let wins:Int
    public let losses:Int
    public let percentage:Double
    public let conferenceRank:Int
    
    
    
    init(
        teamID: Int,
        key:String,
        city:String,
        name:String,
        conference: String,
        wins:Int,
        losses:Int,
        percentage:Double,
        conferenceRank:Int
        
        ){
            self.teamID = teamID
            self.key = key
            self.city = city
            self.name = name
            self.conference = conference
            self.wins = wins
            self.losses = losses
            self.percentage = percentage
            self.conferenceRank = conferenceRank
            
        }
}
