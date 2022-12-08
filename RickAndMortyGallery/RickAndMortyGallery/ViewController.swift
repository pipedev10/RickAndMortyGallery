//
//  ViewController.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 06-12-22.
//

import UIKit

class ViewController: UIViewController, NotificacionSettingViewDelegate {

    //private let notificationsView = NotificacionSettingView()
    private let cardViewCharacter = CardViewCharacter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        //notificationsView.delegate = self
        title = "Rick and Morty"
        //view.addSubview(notificationsView)
//        cardViewCharacter.layer.shadowColor = UIColor.black.cgColor
//        cardViewCharacter.layer.shadowOpacity = 0.2
//        cardViewCharacter.layer.shadowOffset = CGSize(width: 4, height: 4)
//        cardViewCharacter.layer.shadowRadius = 5.0
//        cardViewCharacter.layer.masksToBounds = false
        cardViewCharacter.translatesAutoresizingMaskIntoConstraints = false
        
        let containerStackView = UIStackView(arrangedSubviews: [CardViewCharacter(), CardViewCharacter()])
        containerStackView.axis = .horizontal
        containerStackView.spacing = 8
        containerStackView.distribution = .fillEqually
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
//            cardViewCharacter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            cardViewCharacter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            cardViewCharacter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /*notificationsView.frame = CGRect(x: 10,
                     y: view.safeAreaInsets.top,
                     width: view.frame.size.width-20,
                     height: view.frame.size.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
         */
    }
    
    func didTapEnabledButton() {
        let alert = UIAlertController(
                title: "Enable Notifications",
              message: "Some longer message here to tell user to do stuff",
              preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}

protocol NotificacionSettingViewDelegate: AnyObject {
    func didTapEnabledButton()
}

class NotificacionSettingView: UIView {
    
    weak var delegate: NotificacionSettingViewDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemBlue
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "TO stay up-to-date enable push notifications!"
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Enable notification", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = bounds.size.width / 2
        imageView.frame = CGRect(x: (bounds.size.width - imageSize) / 2, y: 30, width: imageSize, height: imageSize)
            
        label.frame = CGRect(x: 10, y: 30+imageSize+20, width: frame.size.width-20, height: 100)
        
        button.frame = CGRect(x: 40, y: 160+imageSize, width: frame.size.width-80, height: 50)
    }
    
    @objc func didTapButton() {
        // notify controller
        delegate?.didTapEnabledButton()
    }
}
