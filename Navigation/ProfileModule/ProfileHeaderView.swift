//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by kosmokos I on 19.08.2022.
//
import UIKit
import SnapKit

final class ProfileHeaderView: UIView {
    
    // MARK: Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "system", size: 20)
        label.textColor = .white
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jdun")
        imageView.layer.cornerRadius = 65
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Jdun"
        profileName.font = UIFont(name: "Bold", size: 18)
        profileName.textColor = UIColor.black
        return profileName
    }()
    
    lazy var statusLabel: UILabel = {
        let statuslabel = UILabel()
        statuslabel.text = "Waiting for something..."
        statuslabel.font = UIFont(name: "Bold", size: 14)
        statuslabel.textColor = UIColor.black
        return statuslabel
    }()
    
    lazy var showStatusBotton: UIButton = {
        let showStatusBotton = UIButton()
        showStatusBotton.setTitle("Show Status", for: .normal)
        showStatusBotton.setTitleColor(.white, for: .normal)
        showStatusBotton.backgroundColor = .systemBlue
        showStatusBotton.layer.cornerRadius = 4
        showStatusBotton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusBotton.layer.shadowRadius = 4
        showStatusBotton.layer.shadowOpacity = 0.7
        return showStatusBotton
    }()
    
    //MARK: Life Cycle
    
    override func draw(_ rect: CGRect) {
        setupUI()
    }
    
    //MARK: Methods
    
    func setupUI() {
        setupViews()
        setupConstraints()
        addTargets()
    }
    
    private func setupViews(){
        addSubview(titleLabel)
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusLabel)
        addSubview(showStatusBotton)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(3)
            make.centerX.equalToSuperview()
        }

        profileImage.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.width.equalTo(130)
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        profileName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(27)
            make.leading.equalTo(profileImage.snp.trailing).inset(-13)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(profileName.snp.bottom).inset(-45)
            make.leading.equalTo(profileImage.snp.trailing).inset(-13)
        }
        
        showStatusBotton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(statusLabel.snp.bottom).inset(-34)
            make.top.equalTo(profileImage.snp.bottom).inset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    
    }
    
    func addTargets(){
        showStatusBotton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "")
    }
    
}

