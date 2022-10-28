//
//  AppCoordinator.swift
//  Navigation
//
//  Created by kosmokos I on 25.10.2022.
//

import UIKit

/// Определяем, какой тип потоков может быть запущен с этого координатора.
protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showTabBarFlow()
}

/// Координатор приложения. Едиственный координатор, который будет существовать в теченни жизненного цикла приложения.
class AppCoordinator: AppCoordinatorProtocol {
   
    var navigationController: UINavigationController
    
    var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .app }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLoginFlow()
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator.init(navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showTabBarFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .login:
            navigationController.viewControllers.removeAll()
            
            showTabBarFlow()
        default:
            break
        }
    }
}
