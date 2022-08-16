//
//  InfoViewController.swift
//  Navigation
//
//  Created by kosmokos I on 15.08.2022.
//

import UIKit

class InfoViewController : UIViewController{
    
    // MARK: - Properties
    
    let alertController = UIAlertController(title: "hi", message: "What's up?)", preferredStyle: .alert)
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemFill
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonAlert: UIButton = {
        let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemFill
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life cycle and methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        view.addSubview(button)
        view.addSubview(buttonAlert)
        
        NSLayoutConstraint.activate([
            buttonAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        button.addTarget(self, action: #selector(showPostController), for: .touchUpInside)
        buttonAlert.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Alert")
        }))
        
    }
    
    @objc func showPostController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showAlert() {
        self.present(alertController, animated: true, completion: nil)
    }
    
}
