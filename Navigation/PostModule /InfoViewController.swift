//
//  InfoViewController.swift
//  Navigation
//
//  Created by kosmokos I on 15.08.2022.
//

import UIKit

final class InfoViewController : UIViewController{
    
    // MARK: Properties
    
   private let alertController = UIAlertController(title: "hi", message: "What's up?)", preferredStyle: .alert)
    
    private lazy var buttonAlert: UIButton = {
        let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemFill
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        addTargets()
        setupUI()
    }
    
    // MARK: Methods
    
    private func setupUI(){
        view.addSubview(buttonAlert)
        
        NSLayoutConstraint.activate([
            buttonAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("Alert")
            self.dismiss(animated: true)
        }))
    }
    
    private func addTargets(){
        buttonAlert.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        self.present(alertController, animated: true, completion: nil)
    }
    
}
