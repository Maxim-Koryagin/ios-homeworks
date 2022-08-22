//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by kosmokos I on 19.08.2022.
//
import TinyConstraints
import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jdun")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    private let profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Jdun"
        profileName.font = UIFont(name: "Bold", size: 18)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.textColor = UIColor.black
        return profileName
    }()
    private let statusSetField: UITextField = {
        let field = UITextField()
        field.placeholder = "Write your status..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = .default
        field.keyboardAppearance = .default
        field.returnKeyType = . default
        field.autocorrectionType = .yes
        return field
    }()
    private let showStatusBotton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Bold", size: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        statusSetField.delegate = self
        addTargets()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupConstraints() {
        
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusSetField)
        addSubview(statusLabel)
        addSubview(showStatusBotton)
        
        NSLayoutConstraint.activate([
            // Фото профиля
            profileImage.width(120),
            profileImage.height(120),
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            // Имя профиля
            profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            // Статус
            statusSetField.heightAnchor.constraint(equalToConstant: 20),
            statusSetField.widthAnchor.constraint(equalToConstant: 200),
            statusSetField.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 50),
            statusSetField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            // Надпись в статусе
            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 15),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            // кнопка показа статуса
            showStatusBotton.heightAnchor.constraint(equalToConstant: 50),
            showStatusBotton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            showStatusBotton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusBotton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusSetField.text
        statusSetField.text = ""
        print("the status is - \(statusLabel.text!)")
    }
    
    func addTargets(){
        showStatusBotton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
