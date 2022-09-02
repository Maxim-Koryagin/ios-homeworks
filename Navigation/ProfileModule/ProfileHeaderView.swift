//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by kosmokos I on 19.08.2022.
//
import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    
    private lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jdun")
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Jdun"
        profileName.font = UIFont(name: "Bold", size: 18)
        profileName.textColor = UIColor.black
        profileName.translatesAutoresizingMaskIntoConstraints = false
        return profileName
    }()
    private lazy var statusLabel: UILabel = {
        let statuslabel = UILabel()
        statuslabel.text = "Waiting for something..."
        statuslabel.font = UIFont(name: "Bold", size: 14)
        statuslabel.textColor = UIColor.black
        statuslabel.translatesAutoresizingMaskIntoConstraints = false
        return statuslabel
    }()
    private lazy var showStatusBotton: UIButton = {
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
    
    override func draw(_ rect: CGRect) {
        setupUI()
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
            
            profileImage.heightAnchor.constraint(equalToConstant: 130),
            profileImage.widthAnchor.constraint(equalToConstant: 130),
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            
            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 45),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
            
            showStatusBotton.heightAnchor.constraint(equalToConstant: 50),
            showStatusBotton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 34),
            showStatusBotton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            showStatusBotton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusBotton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "No text")
    }
    
    func addTargets(){
        showStatusBotton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
}

