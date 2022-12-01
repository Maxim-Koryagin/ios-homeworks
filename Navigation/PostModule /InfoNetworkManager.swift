//
//  InfoNetworkManager.swift
//  Navigation
//
//  Created by kosmokos I on 26.11.2022.
//

import Foundation

struct Planet: Decodable {
    var orbitalPeriod: String
}

var orbitalPeriod: String = ""
var titlePlanet: String = ""

struct PlanetNetworkManeger {
    
    static func request() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let unwrappedData = data {
                    
                    do {
                        let serializedDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                        
                        if let dict = serializedDictionary as? [String: Any] {
                            if let title = dict["title"] as? String {
                                titlePlanet = title
                            }
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    
        // Second request
        if let url = URL(string: "https://swapi.dev/api/planets/1") {

            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in

                if let unwrappedData = data {

                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let planet = try decoder.decode(Planet.self, from: unwrappedData)
                        orbitalPeriod = planet.orbitalPeriod

                    } catch let error {
                        print(error)
                    }
                }
            })
            task.resume()

        }
    }
        
}
