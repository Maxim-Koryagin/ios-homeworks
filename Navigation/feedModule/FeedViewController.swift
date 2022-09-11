//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: Properties
    
    var dataSource = FeedModel(title: "Feed")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(UIColor.black, for: .application)
        button.backgroundColor =  .systemFill
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods
    
    private func setupUI() {
        view.backgroundColor = .systemCyan
        
        setupViews()
        setupConstraints()
        addTargets()
        titleLabel.text = dataSource.title
    }
    
    private func addTargets() {
        button.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(button)
        view.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc func showDetailController() {
        let detailController = PostViewController()
        navigationController?.pushViewController(detailController, animated: true)
    }
    
}

