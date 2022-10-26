//
//  AppCoordinator.swift
//  Navigation
//
//  Created by kosmokos I on 25.10.2022.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {

    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLoginFlow()
    }
    
    func showLoginFlow() {
        
    }
    
    func showTabBarFlow() {
        
    }
    
    
}
