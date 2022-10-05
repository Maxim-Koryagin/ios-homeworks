//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by kosmokos I on 11.09.2022.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {

    // MARK: Properties

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rightArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.forward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var firstImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var secondImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "3")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var fourthImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // MARK: Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //     MARK: Methods

    private func setupUI() {
        setupViews()
        setupConstraints()
    }

    private func setupViews(){
        contentView.addSubview(backView)
        backView.addSubview(titleLabel)
        backView.addSubview(rightArrow)
        backView.addSubview(stackView)
        stackView.addArrangedSubview(firstImageView)
        stackView.addArrangedSubview(secondImageView)
        stackView.addArrangedSubview(thirdImageView)
        stackView.addArrangedSubview(fourthImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),

            rightArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),

            firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor, multiplier: 1)
        ])

    }
}
