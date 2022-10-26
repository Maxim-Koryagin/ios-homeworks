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
    
    let user: CurrentUserService = {
        let user = CurrentUserService()
        user.user.login = ""
        user.user.fullName = "Mark User"
        user.user.avatar = UIImage(named: "jdun")
        user.user.status = "Waiting for something..."
        return user
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods
    
    private func setupUI() {
        
        let loginViewController = LoginViewController()
        let profileViewController = ProfileViewController(userService: user, name: loginViewController.loginTextField.text!)
        loginViewController.loginDelegate = MyLoginFactory().makeLoginInspector()
        
        firstTabNavidationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: profileViewController)

        viewControllers = [firstTabNavidationController, secondTabNavigationController]
        
        let item1 = UITabBarItem(title: "Feed", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        let item2 = UITabBarItem(title: "Profile", image:  UIImage(systemName: "person"), tag: 1)
        
        firstTabNavidationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(red: 0/255.0, green: 146/255.0, blue: 248/255.0, alpha: 1)
        UITabBar.appearance().backgroundColor = .white
    }
    
}

