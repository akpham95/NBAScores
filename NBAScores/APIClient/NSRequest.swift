//
//  NSRequest.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/31/22.
//

import Foundation
/// https://api.sportsdata.io/v3/nba/scores/json/gamesbydate/2022-DEC-30?key=c508f8e00d534736a0f3e9976da90dc8
final class NSRequest {
    private struct Constants {
        static let baseURL = "https://api.sportsdata.io/v3/nba/scores/json"
        static let apiKey = "c508f8e00d534736a0f3e9976da90dc8"
    }
    
    
    private let endpoint: NSEndpoint
    /// Path components for API, if any
    private let pathComponents: [String]
    /// constructed url for api request in string format
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        string += "?key="
        
        string += Constants.apiKey
        
        return string
    }
    
    /// Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    /// - endpoint: target endpoint
    /// - pathComponents: collection of path components
    public init(
        endpoint: NSEndpoint,
        pathComponents: [String] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
    }
}

extension NSRequest {
    static let listScheduleRequests = NSRequest(endpoint: .GamesByDate, pathComponents: ["2023-JAN-12"])
}
