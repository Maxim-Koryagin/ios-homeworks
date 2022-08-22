//
//  TabBarController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // Создание экземпляров
    var firstTabNavidationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        // Создание рутовых экранов
        firstTabNavidationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        self.viewControllers = [firstTabNavidationController, secondTabNavigationController]
        
        // Стилизация Tab Bar'а
        let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        let item2 = UITabBarItem(title: "Profile", image:  UIImage(systemName: "person"), tag: 1)
        
        firstTabNavidationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1)
        UITabBar.appearance().backgroundColor = .white
    }
    
}

