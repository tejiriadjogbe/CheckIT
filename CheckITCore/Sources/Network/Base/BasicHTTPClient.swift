//
//  BasicHTTPService.swift
//
//
//  Created by Adjogbe  Tejiri on 02/01/2024.
//

import UIKit
import Models

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public class BasicHTTPClient: HTTPClientContract {

    public static let shared = BasicHTTPClient()

    private init() {}

    public func fetchData<T: Codable>(
        url: String,
        data: Codable? = nil,
        method: HTTPMethod = .get,
        completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        // Create a URLRequest with the desired URL
        guard let url = URL(string: url) else {
            // Handle invalid URL
            completion(.failure(ErrorResponse(message: "Invalid Url")))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Encode the data and set the request body
        if method == .post, let data = data {
            do {
                let encoder = JSONEncoder()
                request.httpBody = try encoder.encode(data)
            } catch {
                completion(.failure(ErrorResponse(message: "Network error: \(error.localizedDescription)")))
                return
            }
        }
      
        // Perform the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(ErrorResponse(message: error.localizedDescription)))
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(ErrorResponse(message: "Invalid Response")))
                    return
                }
                //print(httpResponse.allHeaderFields)
                switch httpResponse.statusCode {
                case 200...299:
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data!)
                    completion(.success(result))
                default:
                    completion(.failure(ErrorResponse(httpStatusCode: httpResponse.statusCode, message: "Request failed with status code: \(httpResponse.statusCode)")))
                }
            } catch {
                completion(.failure(ErrorResponse(message: "Network error: \(error.localizedDescription)")))
            }
        }.resume()
    }
}

