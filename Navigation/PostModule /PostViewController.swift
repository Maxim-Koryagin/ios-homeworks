//
//  PostViewController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.
//

import UIKit
import StorageService

final class PostViewController: UIViewController {
    
    // MARK: Properties
    
    var dataSourse = PostModel(title: "Post")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupUI()
    }
    
    //MARK: Methods
    
    private func setupUI(){
        view.addSubview(titleLabel)
        titleLabel.text = dataSourse.title
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let modal = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModal))
        navigationItem.rightBarButtonItems = [modal]
    }
    
    @objc func showModal() {
        let popupViewController = InfoViewController()
        popupViewController.modalPresentationStyle = .automatic
        self.present(popupViewController, animated: true, completion: nil)
    }
    
}






