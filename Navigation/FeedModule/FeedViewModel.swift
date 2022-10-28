//
//  FeedViewModel.swift
//  Navigation
//
//  Created by kosmokos I on 27.10.2022.
//

final class FeedViewModel {
    
    let feedModel = FeedModel()
    
    var statusText = Dynamic("")
    
    func checkPassword(password: String) -> Bool {
        if password == feedModel.secretWord {
            statusText.value = "Right password"
            return true
        } else {
            statusText.value = "Wrong password"
            return false 
        }
    }
    
    
}
