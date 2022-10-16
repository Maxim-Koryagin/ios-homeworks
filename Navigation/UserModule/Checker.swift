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
    private let currentPassword1: String
    
    private init() {
        currentLogin = "mark"
        currentPassword1 = "1234"
    }
    
    func check(login: String, password: String) -> Bool {
        return login == currentLogin && password == currentPassword1 ? true : false
    }
    
}
