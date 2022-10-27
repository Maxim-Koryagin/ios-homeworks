//
//  Dynamic.swift
//  Navigation
//
//  Created by kosmokos I on 27.10.2022.
//

import Foundation

class Dynamic<T> {
    
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func make(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
       value = v
    }
    
}
