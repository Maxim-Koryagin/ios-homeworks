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

    let imageProcessor = ImageProcessor()
    private let dataSource = Photo.makePhotoArray()
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
    
    // MARK: Methods

    private func setupUI() {
        setupViews()
        setupConstraints()
        setupNavBar()
        setupImagesWithTimer()
    }

    private func setupImagesWithTimer() {
       Timer.scheduledTimer(
            timeInterval: 5.0,
            target: self,
            selector: #selector(setupImages),
            userInfo: nil,
            repeats: true)
    }
    
    @objc
    private func setupImages() {
        dataSource.forEach {
            guard let image = UIImage(named: $0.image) else { return }
            imagesArray.append(image)
        }
        
        let start = DispatchTime.now()
        
        imageProcessor.processImagesOnThread(sourceImages: imagesArray, filter: .noir, qos: .userInitiated) { images in
            images.forEach { image in
                self.localImages.append(UIImage(cgImage: image!))
            }
            
            let end = DispatchTime.now()
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            let timeInterval = Double(end.uptimeNanoseconds - start.uptimeNanoseconds)
            print(timeInterval / 1_000_000_000)
        }
        
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

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return localImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.backgroundColor = .systemGray6
        let image = localImages[indexPath.row]
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

