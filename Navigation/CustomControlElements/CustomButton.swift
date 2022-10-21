//
//  CustomButton.swift
//  Navigation
//
//  Created by kosmokos I on 21.10.2022.
//

import UIKit

final class CustomButton: UIButton {

    var tap: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        
        layer.cornerRadius = 10
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.7
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        tap?()
    }
    
}


