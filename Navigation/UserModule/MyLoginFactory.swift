//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by kosmokos I on 16.10.2022.
//

struct MyLoginFactory: Loginfactory {
    
    func makeLoginInspector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
    
}
