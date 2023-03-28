//
//  NSService.swift
//  NBAScores
//
//  Created by Anthony Pham on 12/31/22.
//

import Foundation

/// Primary API service object to get NBA data
final class NSService {
    static let shared = NSService()
    
    private init() {}
    
    enum NSServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
/// Send API Call
    /// - Parameters:
    /// - request:request instance
    /// - type: The type of object we expect to get back
    /// - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: NSRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(NSServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSServiceError.failedToGetData))
                return
            }
            // Decode response Json
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from nsRequest: NSRequest) -> URLRequest? {
        guard let url = nsRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = nsRequest.httpMethod
        return request
    }
}
