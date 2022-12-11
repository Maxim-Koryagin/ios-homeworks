//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var rootCoordinator: AppCoordinator?
    
    let realmService = RealmService()
    let realm = try! Realm()
    let userDefault = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        rootCoordinator = AppCoordinator.init(navigationController)
        rootCoordinator?.start()

        PlanetNetworkManeger.request()
        realmService.createCategory(name: "Users")
        let tabBarController = TabBarController()
        
        let allCategory = realm.objects(Category.self)
        guard let usersCategory = realm.object(ofType: Category.self, forPrimaryKey: allCategory.first?.id) else { return }
        let login = userDefault.string(forKey: "login")
        let password = userDefault.string(forKey: "password")
        if realm.isEmpty {
            print("empty")
        }
        
        print(login, password)
        
        for user in usersCategory.users {
            if login == user.login && password == user.password {
                tabBarController.tabBarStatus = .userAuthorized
                
            }
        }
        print(allCategory.first?.users)

    }
    
}

