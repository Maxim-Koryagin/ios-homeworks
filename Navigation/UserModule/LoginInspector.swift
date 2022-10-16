//
//  LoginInspector.swift
//  Navigation
//
//  Created by kosmokos I on 15.10.2022.
//

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool {
        let checker = Checker.shared
        return checker.check(login: login, password: password)
    }
    
}
