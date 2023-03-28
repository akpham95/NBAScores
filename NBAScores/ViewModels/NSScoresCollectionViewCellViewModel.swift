//
//  NSScoresCollectionViewCellViewModel.swift
//  NBAScores
//
//  Created by Anthony Pham on 1/10/23.
//

import Foundation

final class NSScoresCollectionViewCellViewModel {
    
    public let homeTeam: String
    public let homeTeamScore: Int
    public let awayTeam: String
    public let awayTeamScore: Int
    private let homeTeamImageURL: URL?
    
    init(
        homeTeam: String,
        homeTeamScore: Int,
        awayTeam: String,
        awayTeamScore: Int,
        homeTeamImageURL: URL?
    ){
        self.homeTeam = homeTeam
        self.homeTeamScore = homeTeamScore
        self.awayTeam = awayTeam
        self.awayTeamScore = awayTeamScore
        self.homeTeamImageURL = nil
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void ) {
        guard let url = homeTeamImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
}
