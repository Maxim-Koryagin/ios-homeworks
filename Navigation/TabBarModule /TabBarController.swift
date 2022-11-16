//
//  TabBarController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: Properties
    
    var firstTabNavidationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!
    var thirdTabNavigationController: UINavigationController!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods
    
    private func setupUI() {
        
        let loginViewController = LoginViewController()
        loginViewController.loginDelegate = MyLoginFactory().makeLoginInspector()
        
        firstTabNavidationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: AudioViewController())
        thirdTabNavigationController = UINavigationController.init(rootViewController: loginViewController)
        
        viewControllers = [firstTabNavidationController, secondTabNavigationController, thirdTabNavigationController]
        
        let item1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        let item2 = UITabBarItem(title: "Audio", image: UIImage(systemName: "music.note"), tag: 1)
        let item3 = UITabBarItem(title: "Profile", image:  UIImage(systemName: "person"), tag: 2)
       
        
        firstTabNavidationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        thirdTabNavigationController.tabBarItem = item3
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1)
        UITabBar.appearance().backgroundColor = .white
    }
    
}

