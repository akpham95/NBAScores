//
//  Standings.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/23/22.
//


import Foundation

struct Standings: Codable {
    // Initial teams array parsed from JSON
    var teams:[Team]
    
    // Arrays to be populated in sorting
    var east:[Team]
    var west:[Team]
    
    // Initialized with empty team arrays
    init() {
        self.teams = [Team]()
        self.east = [Team]()
        self.west = [Team]()
    }
    
    // Sorting function (API does not give explicit standings)
    // mutates own properties (needed in struct)
    mutating func sortConferences() {
        
        // Separate main teams array into east and west
        for t in (0..<teams.count) {
            if teams[t].Conference == "Eastern" {
                self.east.append(teams[t])
            } else {
                self.west.append(teams[t])
            }
        }
        
        // Sort east array
        self.east.sort { t1, t2 in
            return t1.Percentage > t2.Percentage
        }
        
        // Sory west array
        self.west.sort { t1, t2 in
            return t1.Percentage > t2.Percentage
        }
    }
}

struct Team: Codable, Identifiable {

    var id:UUID?
    var TeamID:Int
    var Key:String
    var City:String
    var Name:String
    var Conference:String
    var Wins:Int
    var Losses:Int
    var Percentage:Double
    var ConferenceRank:Int
    
}
 


