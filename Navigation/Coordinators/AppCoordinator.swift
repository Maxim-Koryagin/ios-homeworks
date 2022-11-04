//
//  AppCoordinator.swift
//  Navigation
//
//  Created by kosmokos I on 25.10.2022.
//

import UIKit

/// Определяем, какой тип потоков может быть запущен с этого координатора.
protocol AppCoordinatorProtocol: Coordinator {
    func showMainFlow()
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
        showMainFlow()
    }
    
    func showMainFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
}


