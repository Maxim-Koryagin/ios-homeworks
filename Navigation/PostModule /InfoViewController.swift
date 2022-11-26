//
//  InfoViewController.swift
//  Navigation
//
//  Created by kosmokos I on 15.08.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
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
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "\(titlePlanet)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var orbitalPeriodLabel: UILabel = {
       let label = UILabel()
        label.text = "Orbital period - \(orbitalPeriod)"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(titleLabel)
        view.addSubview(orbitalPeriodLabel)
        
        NSLayoutConstraint.activate([
            buttonAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            orbitalPeriodLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orbitalPeriodLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25)
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
