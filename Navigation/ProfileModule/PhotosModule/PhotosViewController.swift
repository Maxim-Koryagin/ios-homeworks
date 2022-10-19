//
//  PhotosViewController.swift
//  Navigation
//
//  Created by kosmokos I on 12.09.2022.
//

import UIKit
import iOSIntPackage

final class PhotosViewController: UIViewController {

    // MARK: Properties

    private enum Constants {
        static let numberOfItemsInLine: CGFloat = 3
    }

    let imagePublisher = ImagePublisherFacade()
    private var dataSource = Photo.makePhotoArray()
    private var imagesArray = [UIImage]()
    private var localImages = [UIImage]()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan

        setupUI()
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupImages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        imagePublisher.removeSubscription(for: self)
        imagePublisher.rechargeImageLibrary()
    }

    //MARK: Methods

    private func setupUI() {
        setupViews()
        setupConstraints()
        setupNavBar()
    }

    private func setupImages() {
        dataSource.forEach {
            guard let image = UIImage(named: $0.image) else { return }
            localImages.append(image)
        }
        imagePublisher.subscribe(self)
        imagePublisher.addImagesWithTimer(time: 0.5, repeat: 20, userImages: localImages)
    }

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNavBar() {
        navigationItem.title = "Photo Gallery"
    }

}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        imagesArray = images
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.backgroundColor = .systemGray6
        let image = imagesArray[indexPath.row]
        cell.imageView.image = image
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let width = collectionView.frame.width - (Constants.numberOfItemsInLine - 1) * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / Constants.numberOfItemsInLine)

        return CGSize(width: itemWidth, height: itemWidth)
    }

}

