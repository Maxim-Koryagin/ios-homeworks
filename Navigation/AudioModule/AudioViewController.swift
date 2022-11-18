//
//  AudioViewController.swift
//  Navigation
//
//  Created by kosmokos I on 15.11.2022.
//
import UIKit
import AVFoundation

final class AudioViewController: UIViewController {
    
    //MARK: Properties
    
    private var player = AVAudioPlayer()
    private var currentTrack = 0
    
    private lazy var audioImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "music.note")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var audioLabel: UILabel = {
        let label = UILabel()
        label.text = "Now playing track"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Author"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playAndPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: Methods
    
    private func setupUI() {
        view.backgroundColor = .systemCyan
        
        setupViews()
        setupConstraints()
        addTargets()
        setupPlayer()
        
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "1", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }


    private func setupViews() {
        view.addSubview(audioImage)
        view.addSubview(authorLabel)
        view.addSubview(audioLabel)
        view.addSubview(playAndPauseButton)
        view.addSubview(backwardButton)
        view.addSubview(forwardButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            audioImage.heightAnchor.constraint(equalToConstant: 120),
            audioImage.widthAnchor.constraint(equalToConstant: 40),
            audioImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            audioImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 135),
            audioImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -135),
            
            audioLabel.topAnchor.constraint(equalTo: audioImage.bottomAnchor, constant: 40),
            audioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: audioLabel.bottomAnchor, constant: 10),
            authorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            playAndPauseButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            playAndPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backwardButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            backwardButton.rightAnchor.constraint(equalTo: playAndPauseButton.leftAnchor, constant: -40),
            
            forwardButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            forwardButton.leftAnchor.constraint(equalTo: playAndPauseButton.rightAnchor, constant: 40)
            
        ])
        
    }
    
    private func addTargets() {
        playAndPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        backwardButton.addTarget(self, action: #selector(didTapBackwardButton), for: .touchUpInside)
        forwardButton.addTarget(self, action: #selector(didTapForwardButton), for: .touchUpInside)
    }
    
    private func setupPlayer() {
        
        do {
            let tracks = TrackModel.tracks[currentTrack]
            
            audioLabel.text = tracks.name
            authorLabel.text = tracks.artist
            
            guard let path = Bundle.main.path(forResource: tracks.bundleName, ofType: tracks.format) else { return }
            let url = URL(fileURLWithPath: path)
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch {
            print(error)
        }
        
    }
    
    @objc
    private func didTapPlayPauseButton() {
        if player.isPlaying {
            player.stop()
            playAndPauseButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player.play()
            playAndPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        
    }
    
    @objc
    private func didTapBackwardButton() {
        currentTrack = (currentTrack - 1)
        if currentTrack < 0 {
            currentTrack = 0
        }
        setupPlayer()
        player.play()
    }
    
    @objc
    private func didTapForwardButton() {
        if currentTrack < TrackModel.tracks.count - 1 {
            currentTrack += 1
        }
        setupPlayer()
        player.play()
    }
    
}
