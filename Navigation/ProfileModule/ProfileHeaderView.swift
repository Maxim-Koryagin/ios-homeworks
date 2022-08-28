//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by kosmokos I on 19.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    
    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jdun")
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    private var profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Jdun"
        profileName.font = UIFont(name: "Bold", size: 18)
        profileName.textColor = UIColor.black
        return profileName
    }()
    private var statusLabel: UILabel = {
        let statuslabel = UILabel()
        statuslabel.text = "Waiting for something..."
        statuslabel.font = UIFont(name: "Bold", size: 14)
        statuslabel.textColor = UIColor.black
        return statuslabel
    }()
    private var showStatusBotton: UIButton = {
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
        setupFrames()
    }
    
    func setupFrames() {
        
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusLabel)
        addSubview(showStatusBotton)
        
        profileImage.frame = CGRect(x: 15, y: 80, width: 120, height: 120)
        
        profileName.frame = CGRect(x: Int(profileImage.frame.maxX) + 15, y: 90, width: 130, height: 18)
        
        statusLabel.frame = CGRect(x: Int(profileImage.frame.maxX) + 15, y: Int(profileName.frame.minY) + 70, width: 200, height: 20)
        
        showStatusBotton.frame = CGRect(x: 20, y: profileImage.frame.maxY + 16, width: 350, height: 50)
        
    }
    
    @objc func buttonPressed() {
        print(statusLabel.text!)
    }
    
    func addTargets(){
        showStatusBotton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
}

