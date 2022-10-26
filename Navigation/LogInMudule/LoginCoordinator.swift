//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by kosmokos I on 25.10.2022.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
    func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .login }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLoginViewController()
    }
    
    func showLoginViewController() {
        let loginVC = LoginViewController()
        loginVC.didSentEventClosure = { [weak self] event in
            self?.finish()
        }
        navigationController.pushViewController(loginVC, animated: true)
    }
    
}
