//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by kosmokos I on 15.10.2022.
//

import UIKit

protocol LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool
    
}
