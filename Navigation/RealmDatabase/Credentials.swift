//
//  Credentials.swift
//  Navigation
//
//  Created by kosmokos I on 10.12.2022.
//

//import Foundation
//
//struct Credentials {
//
//     let email: String
//     var password: String
//
//    var keyedValues: [String: Any] {
//        return [
//            "email": self.email,
//            "password": self.password
//        ]
//    }
// }

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var categoryName = ""
    dynamic var users = List<NewUsers>()
    override static func primaryKey() -> String? {
        return "id"
    }
}

class NewUsers: Object {
    @objc dynamic var login = ""
    @objc dynamic var password = ""
}
