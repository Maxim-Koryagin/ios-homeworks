//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by kosmokos I on 15.10.2022.
//

import UIKit

protocol LoginViewControllerDelegate: CheckerServiceProtocol {
    func checkCredentials(email: String, password : String, complition: @escaping (String) -> Void)
    func signUp(email: String, password : String, complition: @escaping (String) -> Void)
}
