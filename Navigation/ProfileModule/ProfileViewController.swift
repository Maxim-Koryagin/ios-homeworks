//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.
  

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        
        return profileHeader
    
    private var dataSource: [Posts] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .systemCyan
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCellID")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCellID")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Methods
    
    private func setupUI(){
        view.backgroundColor = .systemCyan
        setupNavBar()
        setupViews()
        setupConstraints()
        addPosts()
    }
    
    private func setupNavBar(){
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViews(){
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addPosts() {
        dataSource.append(.init(author: "CarGuy", description: "Nissan r36 concept", image: "Nissan r36", likes: 346, views: 1528))
        dataSource.append(.init(author: "Hi Tech", description: "New macbook air!", image: "macbook m2", likes: 1556, views: 3694))
        dataSource.append(.init(author: "querly", description: "new look", image: "supermoto", likes: 234, views: 863))
        dataSource.append(.init(author: "JJ", description: "Clear :)", image: "table", likes: 323, views: 1352))
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellID", for: indexPath) as? PostTableViewCell
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
            
            return cell
        }
        
        let dataSource = dataSource[indexPath.row]
        cell.setup(dataSource)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = profileHeader
        header.backgroundColor = .systemCyan
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }
    
}
