//
//  CardView.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 06-12-22.
//

import UIKit

protocol CardViewDelegate: AnyObject {
    func didTappedButton(word: String)
}

class CardView: UIView {
    
    weak var delegate: CardViewDelegate?
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "rickandmorty")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Bienvenido a la App de Rick and Morty"
        label.textColor = .blue
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var skipOnBoardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa para continuar"
        config.subtitle = "Onboarding"
        
        let button = UIButton(type: .system)
        button.addTarget(CardView.self, action: #selector(showMessage), for: .touchUpInside)
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Hola", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        isUserInteractionEnabled = true
        //skipOnBoardingButton.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        //[onboardingImageView, textLabel, skipOnBoardingButton, button]
        //    .forEach(addSubview)
        addSubview(button)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            /*onboardingImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -82),
            onboardingImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textLabel.bottomAnchor.constraint(equalTo: skipOnBoardingButton.topAnchor, constant: -42),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            skipOnBoardingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            skipOnBoardingButton.centerYAnchor.constraint(equalTo: centerYAnchor),*/
            
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
    
    @objc func showMessage() {
        print("Skip onboarding")
        delegate?.didTappedButton(word: "Hello")
    }
}
