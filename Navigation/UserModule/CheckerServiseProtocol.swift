//
//  CheckerServiseProtocol.swift
//  Navigation
//
//  Created by kosmokos I on 01.12.2022.
//

import Foundation

protocol CheckerServiceProtocol {
    func checkCredentials(email: String, password : String, complition: @escaping (String) -> Void)
    func signUp(email: String, password : String, complition: @escaping (String) -> Void)
}
