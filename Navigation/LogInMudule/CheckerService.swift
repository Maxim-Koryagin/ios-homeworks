//
//  CheckerService.swift
//  Navigation
//
//  Created by kosmokos I on 30.11.2022.
//

import Foundation
import FirebaseAuth

protocol CheckerServiceProtocol {
    func checkCredentials(email: String, password : String, complition: @escaping (String) -> Void)
    func signUp(email: String, password : String, complition: @escaping (String) -> Void)
}

class CheckerService: CheckerServiceProtocol {
    func checkCredentials(email: String, password : String, complition: @escaping (String) -> Void) {

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                let result = error?.localizedDescription as? String
                    if let response = result {
                        complition(response)
                    }
            } else {
                complition("authorization complited")
            }
        }

    }
    
    func signUp(email: String, password : String, complition: @escaping (String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                let result = error?.localizedDescription as? String
                    if let response = result {
                        complition(response)
                    }
            } else {
                complition("registration complited")
            }
        }
    }

}
