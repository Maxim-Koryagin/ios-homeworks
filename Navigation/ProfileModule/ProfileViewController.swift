//
//  SecondTabVC.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.
//
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private let profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        return profileHeader
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life cecle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupConstraints()
        view.addSubview(profileHeader)
    }
    
    //MARK: - Methods
    
    func setupConstraints(){
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        profileHeader.frame = self.view.frame
    }
    
}
