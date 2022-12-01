//
//  LoginInspector.swift
//  Navigation
//
//  Created by kosmokos I on 15.10.2022.
//
import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    
    let checkerService = CheckerService()
    
    func checkCredentials(email: String, password: String, complition: @escaping (String) -> Void) {
        checkerService.checkCredentials(email: email, password: password, complition: complition)
    }
    
    func signUp(email: String, password: String, complition: @escaping (String) -> Void) {
        checkerService.signUp(email: email, password: password, complition: complition)
    }
    
}
