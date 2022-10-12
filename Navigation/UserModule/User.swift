//
//  User.swift
//  Navigation
//
//  Created by kosmokos I on 11.10.2022.
//

import UIKit

protocol UserService {
    func checkLogin(login: String) -> User?
}

final class User {

    let login: String
    let fullName: String
    let avatar: UIImage
    let status: String

    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
    
}

final class CurrentUserService: UserService {
    
    let user = User(login: "qwerty", fullName: "Mark Zuckerberg", avatar: UIImage(named: "jdun")!, status: "waiting for something...")
    
    func checkLogin(login: String) -> User? {
        
        if user.login == login {
            return user
        } else {
            return nil
        }
    }

}


class TestUserService: UserService {
    
    let user = User(login: "1234", fullName: "Test User", avatar: UIImage(named: "emptyAvatar")!, status: "Test")
    
    func checkLogin(login: String) -> User? {
        return user
    }
    
    
    
    
}
