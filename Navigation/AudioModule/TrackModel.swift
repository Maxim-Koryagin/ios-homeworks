//
//  Track model.swift
//  Navigation
//
//  Created by kosmokos I on 15.11.2022.
//



struct Track {
    let name: String
    let artist: String
    let bundleName: String
    let format: String
}

struct TrackModel {
    
    static var tracks: [Track] = [
    
        Track(name: "Steel Rail Blues", artist: "Gordon Lightfoot", bundleName: "1", format: "mp3"),
        Track(name: "Kids With Guns", artist: "Gorillaz", bundleName: "2", format: "mp3"),
        Track(name: "November Has Come", artist: "Gorillaz, MFDOOM", bundleName: "3", format: "mp3"),
        Track(name: "When I R.I.P", artist: "Labrinth", bundleName: "4", format: "mp3"),
        Track(name: "Since I've Been Loving You", artist: "Led Zeppelin", bundleName: "5", format: "mp3")
        
    ]
    
}
