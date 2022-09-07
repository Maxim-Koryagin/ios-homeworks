//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by kosmokos I on 06.09.2022.

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: Properties

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont(name: "System", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "System", size: 18)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "system", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Methods

    private func setupConstraints() {
        contentView.backgroundColor = .white
        contentView.addSubviews(authorLabel, image, descriptionLabel, likesLabel, viewsLabel)

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
            
        ])

    }

    func setup(with posts: Posts) {
        self.authorLabel.text = posts.author
        self.image.image = UIImage(named: posts.image)
        self.descriptionLabel.text = posts.description
        self.viewsLabel.text = "Views: " + String(posts.views)
        self.likesLabel.text = "Likes: " + String(posts.likes)
    }

}

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview ( $0 ) }
    }
    
}
