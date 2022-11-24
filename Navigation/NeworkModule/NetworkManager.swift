//
//  NetworkManager.swift
//  Navigation
//
//  Created by kosmokos I on 22.11.2022.
//

import Foundation

struct NetworkManager {
    
    static func request(for configuration: AppConfiguration) {
        
        guard let url = URL(string: configuration.rawValue) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print("data - \(string)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status code - \(response.statusCode), Headers - \(response.allHeaderFields)")
            }
            
            if let error = error {
                print(" Error - \(error) ")
            }
            
        }
        task.resume()
        
    }
    
}
