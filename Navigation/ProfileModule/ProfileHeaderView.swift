//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by kosmokos I on 19.08.2022.
//
import UIKit
import TinyConstraints

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jdun")
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Jdun"
        profileName.font = UIFont(name: "Bold", size: 18)
        profileName.textColor = UIColor.black
        profileName.translatesAutoresizingMaskIntoConstraints = false
        return profileName
    }()
    private let statusLabel: UILabel = {
        let statuslabel = UILabel()
        statuslabel.text = "Waiting for something..."
        statuslabel.font = UIFont(name: "Bold", size: 14)
        statuslabel.textColor = UIColor.black
        statuslabel.translatesAutoresizingMaskIntoConstraints = false
        return statuslabel
    }()
    private let showStatusBotton: UIButton = {
        let showStatusBotton = UIButton()
        showStatusBotton.setTitle("Show Status", for: .normal)
        showStatusBotton.setTitleColor(.white, for: .normal)
        showStatusBotton.backgroundColor = .systemBlue
        showStatusBotton.layer.cornerRadius = 4
        showStatusBotton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusBotton.layer.shadowRadius = 4
        showStatusBotton.layer.shadowOpacity = 0.7
        showStatusBotton.translatesAutoresizingMaskIntoConstraints = false
        return showStatusBotton
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func setupUI() {

        addTargets()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusLabel)
        addSubview(showStatusBotton)
        
        NSLayoutConstraint.activate([
            
            profileImage.height(130),
            profileImage.width(130),
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            
            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 45),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            
            showStatusBotton.height(50),
            showStatusBotton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 34),
            showStatusBotton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            showStatusBotton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusBotton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text!)
    }
    
    func addTargets(){
        showStatusBotton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
}

