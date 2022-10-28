//
//  Checker.swift
//  Navigation
//
//  Created by kosmokos I on 15.10.2022.
//

import UIKit

final class Checker {
    
    static let shared = Checker()
    
    private let currentLogin: String
    private let currentPassword: String

    private init() {
        currentLogin = "m"
        currentPassword = "1"
    }

    func check(login: String, password: String) -> Bool {
        return login == currentLogin && password == currentPassword ? true : false
    }

}
