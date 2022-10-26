//
//  FeedModel.swift
//  Navigation
//
//  Created by Maxim Koryagin 14.08.2022.

struct FeedModel {
    
    var title: String
    
    private let secretWord = "1"
    
    func check(word: String) -> Bool {
        return word == secretWord ? true : false
    }
    
}
