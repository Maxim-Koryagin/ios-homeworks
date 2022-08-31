//
//  SecondTabVC.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.
//
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        return profileHeader
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        setupConstraints()
        
    }
    
    //MARK: - Methods
    
    func setupConstraints(){
        view.addSubview(titleLabel)
        view.addSubview(profileHeader)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            
        ])
    }
    
    override func viewWillLayoutSubviews() {
        profileHeader.frame = self.view.frame
    }
}

