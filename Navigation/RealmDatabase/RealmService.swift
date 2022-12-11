//
//  RealmService.swift
//  Navigation
//
//  Created by kosmokos I on 11.12.2022.
//

import Foundation
import RealmSwift
//
//final class RealmService {
//    
//    let database = try! Realm()
//    
//    func createCategory(name: String) {
//        let category = Category()
//        category.categoryName = name
//        try! database.write({
//            database.add(category)
//        })
//    }
//    
//    func createUser(categoryId: String, user: NewUsers) {
//        guard let category = database.object(ofType: Category.self, forPrimaryKey: categoryId) else { return }
//        try! database.write({
//            category.users.append(user)
//        })
//    }
//    
//    func deleteAllCategory() {
//        try! database.write({
//            _ = database.objects(Category.self)
//            database.deleteAll()
//        })
//    }
//    
//}

class RealmService {
    //создаем БД
    let realm = try! Realm()
    //create Category
    func createCategory(name: String) {
        let category = Category()
        category.categoryName = name
        try! realm.write({
            realm.add(category)
        })
    }
    //create User
    func addUser(categoryId: String, user: NewUsers) {
        guard let category = realm.object(ofType: Category.self, forPrimaryKey: categoryId) else { return }
        try! realm.write({
            category.users.append(user)
        })
    }
    
    //delete Category

    //delete User
    
    //deleteAll
    func deleteAllCategory() {
        try! realm.write({
            _ = realm.objects(Category.self)
            realm.deleteAll()
        })
    }
    
}
