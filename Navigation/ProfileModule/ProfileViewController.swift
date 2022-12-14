//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maxim Koryagin on 14.08.2022.

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Properties
        
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        
        return profileHeader
    }()
    
    let userService: UserService
    let name: String
    
    init(userService: UserService, name: String) {
        self.userService = userService
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var dataSource: [Post] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .systemCyan
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCellID")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "jdun")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 65
        image.alpha = 0
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.isUserInteractionEnabled = true
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .white.withAlphaComponent(0.02)
        button.tintColor = .white
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var startPoint: CGPoint? = nil
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Methods
    
    private func setupUI(){

        #if DEBUG
        view.backgroundColor = .white
        #else
        view.backgroundColor = #colorLiteral(red: 0.1922347248, green: 0.6801101565, blue: 0.9027846456, alpha: 1)
        #endif
        
        setupViews()
        setupConstraints()
        addPosts()
        addTargets()
        tapGestureRecognizer()
        
    }
    
    private func setupViews(){
        view.addSubview(tableView)
        view.addSubview(blurView)
        blurView.contentView.addSubview(profileImage)
        blurView.contentView.addSubview(closeButton)
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        blurView.effect = blurEffect
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileImage.heightAnchor.constraint(equalToConstant: 130),
            profileImage.widthAnchor.constraint(equalToConstant: 130),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            closeButton.heightAnchor.constraint(equalToConstant: 60),
            closeButton.widthAnchor.constraint(equalToConstant: 60),
            closeButton.topAnchor.constraint(equalTo:  blurView.safeAreaLayoutGuide.topAnchor, constant: 24),
            closeButton.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -16)
            
            
        ])
    }
    private func addTargets() {
        closeButton.addTarget(self, action: #selector(closeTapGesture), for: .touchUpInside)
    }
    
    private func tapGestureRecognizer() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        profileHeader.profileImage.addGestureRecognizer(imageTapGesture)
    }
    
    @objc private func tapGesture() {
        
        startPoint = self.profileImage.center
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.alpha = 1
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.blurView.alpha = 1
            self.profileImage.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
            self.profileImage.transform = CGAffineTransform(scaleX: self.blurView.frame.width / 114, y: self.blurView.frame.width / 114)
            self.profileImage.layer.borderWidth = 0.4
            self.profileImage.layer.cornerRadius = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc private func closeTapGesture() {
        
        guard let startPoint = startPoint else { return  }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
            self.closeButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                self.profileImage.transform = .identity
                self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
                self.profileImage.center = startPoint
                self.blurView.alpha = 0
            } completion: { _ in
                self.profileImage.alpha = 0
            }
        }
    }
    
    private func addPosts() {
        dataSource.append(.init(author: "CarGuy", description: "Nissan r36 concept", image: "Nissan r36", likes: 346, views: 1528))
        dataSource.append(.init(author: "Hi Tech", description: "New macbook air!", image: "macbook m2", likes: 1556, views: 3694))
        dataSource.append(.init(author: "querly", description: "new look", image: "supermoto", likes: 234, views: 863))
        dataSource.append(.init(author: "JJ", description: "Clear :)", image: "table", likes: 323, views: 1352))
        
    }
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
                
                return cell
            }
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self] _ in
                let dataSource = dataSource[indexPath.row - 1]
                cell.setup(dataSource)
            }

            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = profileHeader
        header.backgroundColor = #colorLiteral(red: 0.1922347248, green: 0.6801101565, blue: 0.9027846456, alpha: 1)
        
        let user = userService.checkLogin(login: name)
        header.profileName.text = user?.fullName
        header.profileImage.image = user?.avatar
        header.statusLabel.text = user?.status
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
    
}
