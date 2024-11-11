//
//  BasicDataSource.swift
//  ShireWorkout
//
//  Created by Chris Shireman on 9/18/24.
//

import Foundation
import UIKit

class BasicDataSource {
    
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func get<T: Codable>(completion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: baseURL + "/endpoint") else {
            completion(nil, "Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(nil, error)
                } else {
                    completion(nil, "No data in response")
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, error)
                return
            }
        }
        
        task.resume()
    }
}
