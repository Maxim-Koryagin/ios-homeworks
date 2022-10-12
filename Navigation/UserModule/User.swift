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

    var login: String?
    var fullName: String?
    var avatar: UIImage?
    var status: String?
    
}

final class CurrentUserService: UserService {
    
    let user = User()
    
    func checkLogin(login: String) -> User? {
        return user.login == login ? user : nil
    }

}


final class TestUserService: UserService {
    
    let user: User = {
        let user = User()
        user.login = "1234"
        user.fullName = "Test fullname"
        user.status = "Test status"
        user.avatar = UIImage(named: "emptyAvatar")
        return user
    }()
    
    func checkLogin(login: String) -> User? {
        return user
    }
    
}
