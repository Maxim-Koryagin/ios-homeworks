//
//  Coordinator.swift
//  Navigation
//
//  Created by kosmokos I on 25.10.2022.
//
import UIKit

// MARK: Координатор
protocol Coordinator: AnyObject {
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    /// Каждый координатор имеет один навигационный контроллер.
    var navigationController: UINavigationController { get set }
    
    /// Массив для отслеживания всех дочерних координаторов.
    var childCoordinators: [Coordinator] { get set }
    
    /// Определенный тип потока.
    var type: CoordinatorType { get }
    
    /// Функция для размещения логики, чтобы запустить поток.
    func start()
    
    /// Функция для размещения логики чтобы завершить поток, очистки всех дочерних координаторов и уведомления родителя о том, что этот координатор готов к освобождению
    func finish()
    
    init(_ navigationController: UINavigationController)
    
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

/// Протокол помогающий родителю Coordinator знать когда его дочерний координатор готов к завершению работы.
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}

// MARK: Типы координатора
/// Перечисление для того чтобы знать какой тип потока мы можем использовать в приложении.
enum CoordinatorType {
    case app, tab
}
